import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:muqaddama/core/constants/app_assets.dart';
import 'package:muqaddama/core/constants/app_colors.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, String>> onboardingViewData = const [
    {
      'image': AppAssets.onboardingViewImg1,
      'title': 'Lorem Ipsum',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolor',
    },

    {
      'image': AppAssets.onboardingViewImg2,
      'title': 'Lorem Ipsum',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolor',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ---- image, title, description
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemCount: onboardingViewData.length,
                  itemBuilder: (context, index) {
                    final data = onboardingViewData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(data['image']!),

                        SizedBox(height: 50),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              _buildText(
                                text: data['title']!,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),

                              SizedBox(height: 10),

                              _buildText(
                                text: data['description']!,
                                color: AppColors.descriptionTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // ---- active page indicator
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingViewData.length, (index) {
                    bool isActive = _currentPage == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.bgBlack : AppColors.bgWhite,
                        boxShadow: isActive ? [] : [BoxShadow(color: AppColors.boxShadowColor, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 2))],
                        shape: BoxShape.circle
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText({
    required String text,
    double fontSize = 16,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
