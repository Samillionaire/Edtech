import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  final PageController _controller = PageController();
  String _buttonText = 'Next';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE5FFD8), Color(0xFFFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Page content
          Column(
            children: [
              const SizedBox(height: 140),

              // Illustration
              Image.asset(
                'assets/Onboarding Illustration-3.png',
                height: 250,
              ),

              SizedBox(height: 140,),

              // White container with title, subtitle, and navigation elements
              Center(
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),

                      // Title
                      const Text(
                        'Education is the best            learn ever',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Subtitle
                      const Text(
                        'It is a long established fact that a reader will '
                            'be distracted by the readable content of a page '
                            'when looking at its layout.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Smooth page indicator
                      SmoothPageIndicator(
                        controller: PageController(), // Replace with actual controller
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xFFAB1CAF),
                          dotColor: Colors.grey,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Navigation buttons (Skip and Next)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Skip button
                          GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(2); // Skip to the last page
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          // Next button
                          GestureDetector(
                            onTap: () {
                              if (_controller.page?.round() == 2) {
                                // Navigate to the next screen
                                Navigator.pushReplacementNamed(
                                    context, '/loginPage1');
                              } else {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 13),
                              decoration: BoxDecoration(
                                color: const Color(0xFFAB1CAF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                _buttonText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
