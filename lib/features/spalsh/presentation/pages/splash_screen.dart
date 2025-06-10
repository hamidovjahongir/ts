import 'package:flutter/material.dart';
import 'package:ts/core/utils/images.dart';
import 'package:ts/core/widgets/my_novigation_bar.dart';
import 'package:ts/features/auth/data/repository/local_repository.dart';
import 'package:ts/features/onbording/presentation/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthRepositories _authRepositories = AuthRepositories();
  @override
  void initState() {
    super.initState();
    check();
  }

  Future<void> check() async {
    String? token = await _authRepositories.getToken();
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (x) => MyBottomNavigationBar()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (x) => Onboarding()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset(AppImages.splash_logo1)),
    );
  }
}
