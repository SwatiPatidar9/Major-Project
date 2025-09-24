import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:new_project/%20views/dashboard_screen.dart';
//
// import '../common/shared_preferences.dart';
// import 'introduction_screen.dart';
import '../api/sessionManager.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
    // Delay of 2 seconds
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => isLoggedIn ? DashboardScreen() : IntroductionScreen(),),
    //   //  MaterialPageRoute(builder: (_) => const IntroductionScreen()),
    //    // home: isLoggedIn ? HomePage() : LoginPage(),
    //   );
    // });
  }
  void _navigateAfterDelay() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check login status from SessionManager
    bool isLoggedIn = await SessionManager.isLoggedIn();

    // Navigate based on login status
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
          isLoggedIn ?  DashboardScreen() :  LoginScreen(),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}