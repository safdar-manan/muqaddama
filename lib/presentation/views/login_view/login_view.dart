import 'package:flutter/material.dart';
import 'package:muqaddama/core/constants/app_assets.dart';
import 'package:muqaddama/core/constants/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void _lawyerLogin() {
    print('Login as a Lawer');
  }

  void _clerkLogin() {
    print('Login as a Clerk');
  }

  void _clientLogin() {
    print('Login as a Client');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 250,
            //   child: Stack(
            //     clipBehavior: Clip.none,
            //     children: [
            //       Positioned(
            //         top: -230,
            //         right: -130,
            //         child: Image.asset(AppAssets.loginViewDesignImg, fit: BoxFit.cover,),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Select Your Role',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(height: 24),

                  // ---- Lawyer login Button
                  _buildElevatedButton(title: 'Login as a Lawyer', onPressed: _lawyerLogin),

                  SizedBox(height: 20),

                  // ---- Clerk login Button
                  _buildElevatedButton(title: 'Login as a Clerk', onPressed: _clerkLogin),

                  SizedBox(height: 20),

                  // ---- Client login Button
                  _buildElevatedButton(
                    title: 'Login as a Client',
                    onPressed: _clientLogin,
                    backgroundColor: AppColors.bgBlack,
                    foregroundColor: AppColors.bgWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton({
    required String title,
    required VoidCallback onPressed,
    Color? backgroundColor = AppColors.loginViewBtnbgColor,
    Color? foregroundColor = AppColors.bgBlack,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
