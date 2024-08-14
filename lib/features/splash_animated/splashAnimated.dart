import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:p_boursa/core/services/shared_preferences_service.dart';
import 'package:p_boursa/features/auth/presentation/pages/Login.dart';
import 'package:p_boursa/features/home/presentation/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class Splash_Animated extends StatelessWidget {
  const Splash_Animated({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSplashScreen(
        splashIconSize: 199,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        splashTransition: SplashTransition.scaleTransition,
        splash: const Image(image: AssetImage("images/TENDER.jpg")),
        nextScreen: SharedPreferencesService.getToken() == null
            ? const LoginScreen()
            : const HomePageScreen(),
      ),
    );
  }
}
