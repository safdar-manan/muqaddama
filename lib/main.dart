import 'package:flutter/material.dart';
import 'package:muqaddama/core/config/routes/route_names.dart';
import 'package:muqaddama/core/constants/app_name.dart';
import 'package:muqaddama/presentation/views/home_view/home_view.dart';
import 'package:muqaddama/presentation/views/login_view/login_view.dart';
import 'package:muqaddama/presentation/views/onboarding_view/onboarding_view.dart';
import 'package:muqaddama/presentation/views/splash_view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppName.appName,
      initialRoute: RouteNames.splashView,
      routes: {
        RouteNames.splashView: (context) => const SplashView(),
        RouteNames.onboardingView: (context) => const OnboardingView(),
        RouteNames.loginView: (context) => const LoginView(),
        RouteNames.homeView: (context) => const HomeView(),
      },
    );
  }
}
