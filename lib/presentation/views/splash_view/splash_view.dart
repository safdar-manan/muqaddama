import 'package:flutter/material.dart';
import 'package:muqaddama/core/config/routes/route_names.dart';
import 'package:muqaddama/core/constants/app_assets.dart';
import 'package:muqaddama/core/constants/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.onboardingView);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _goToNextView();
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
              Image.asset(AppAssets.muqaddamaLogo),
            ],
          ),
        ),
      ),
    );
  }
}
