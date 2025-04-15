import 'package:flutter/material.dart';
import 'package:techtaste/pages/_core/app_colors.dart';
import 'package:techtaste/pages/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Image.asset('assets/banners/banner_splash.png'),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  const SizedBox(height: 130),
                  Image.asset('assets/logo.png', width: 192),
                  const SizedBox(height: 6),
                  const Column(
                    children: [
                      Text("Um parceiro inovador para sua",
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                      Text("melhor experiência culinária!",
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        child: const Text('Bora!')),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
