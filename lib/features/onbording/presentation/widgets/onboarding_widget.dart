import 'package:flutter/material.dart';
import 'package:ts/features/spalsh/presentation/pages/Login_splash_screen.dart';

class OnboardingWidget extends StatelessWidget {
  final String phoneImage;
  final String pinkBoxImage;
  final String vectorImage;
  final String title;
  final int currentPage;
  final int totalPages;

  final double? pinkBoxTop;
  final double? pinkBoxLeft;
  final double? pinkBoxRight;
  final double? pinkBoxHeight;
  final double? pinkBoxWidth;

  final double? vectorTop;
  final double? vectorLeft;
  final double? vectorRight;
  final double? vectorHeight;
  final double? vectorWidth;

  const OnboardingWidget({
    super.key,
    required this.phoneImage,
    required this.pinkBoxImage,
    required this.vectorImage,
    required this.title,
    required this.currentPage,
    required this.totalPages,
    this.pinkBoxTop,
    this.pinkBoxLeft,
    this.pinkBoxRight,
    this.pinkBoxHeight,
    this.pinkBoxWidth,
    this.vectorTop,
    this.vectorLeft,
    this.vectorRight,
    this.vectorHeight,
    this.vectorWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Image.asset(phoneImage, height: 550),
          ),
          Positioned(
            top: pinkBoxTop,
            left: pinkBoxLeft,
            right: pinkBoxRight,
            child: Image.asset(
              pinkBoxImage,
              height: pinkBoxHeight,
              width: pinkBoxWidth,
            ),
          ),
          Positioned(
            top: vectorTop,
            left: vectorLeft,
            right: vectorRight,
            child: Image.asset(
              vectorImage,
              height: vectorHeight,
              width: vectorWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(
                            totalPages,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.pink),
                                color:
                                    currentPage == index
                                        ? Colors.pink
                                        : Colors.grey.shade900,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 60),
                        TextButton(
                          onPressed: () {
                            if (currentPage == totalPages - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (x) => Screen()),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (x) => Screen()),
                              );
                            }
                          },
                          child: Text(
                            currentPage == totalPages - 1 ? "Start" : "Skip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
