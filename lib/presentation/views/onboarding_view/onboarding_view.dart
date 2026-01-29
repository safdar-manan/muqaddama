import 'package:flutter/material.dart';
import 'package:muqaddama/core/config/routes/route_names.dart';
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
                padding: const EdgeInsets.only(bottom: 28),
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
                        boxShadow: isActive
                            ? []
                            : [
                                BoxShadow(
                                  color: AppColors.boxShadowColor,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 2),
                                ),
                              ],
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),

              // ---- Button for next/start
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: OutlinedButton(
                  onPressed: () {
                    _currentPage < onboardingViewData.length - 1
                        ? _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          )
                        : Navigator.pushReplacementNamed(
                            context,
                            RouteNames.loginView,
                          );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.bgBlack,
                    foregroundColor: AppColors.bgWhite,
                    overlayColor: AppColors.bgWhite.withValues(alpha: 0.8),
                    side: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Text(
                        _currentPage < onboardingViewData.length - 1
                            ? 'Next'
                            : 'Get Started',
                        style: TextStyle(fontSize: 16),
                      ),

                      if (_currentPage < onboardingViewData.length - 1)
                        // Image.asset(AppAssets.icChevronRight, height: 20,),
                        Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
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
