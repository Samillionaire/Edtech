import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'loginPage1.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  final PageController _controller = PageController();
  String _buttonText = 'Next';
  int _currentPage = 0;
  List<List<Color>> _gradients = [
    [Color(0xFFDEE9FF), Color(0xFFFFFFFF)], // Gradient for page 1
    [Color(0xFFFCECDB), Color(0xFFFFFFFF)], // Gradient for page 2
    [Color(0xFFE5FFD8), Color(0xFFFFFFFF)], // Gradient for page 3
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
        _buttonText = _currentPage == 2 ? 'Get Started' : 'Next';
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          // Swiping left
          if (_currentPage < 2) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        } else if (details.primaryVelocity! > 0) {
          // Swiping right
          if (_currentPage > 0) {
            _controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _gradients[_currentPage],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // PageView for Onboarding Pages
            PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                  _buttonText = page == 2 ? 'Next' : 'Next';
                });
              },
              children: [
                OnboardingPage(
                  image: 'assets/Onboarding Illustration 1.png',
                  title: 'Education is the best learn ever',
                  subtitle:
                  'It is a long established fact that a reader will be distracted by the readable content of a page.',
                ),
                OnboardingPage(
                  image: 'assets/Onboarding Illustration-2.png',
                  title: 'Education is the best learn ever',
                  subtitle:
                  'It is a long established fact that a reader will be distracted by the readable content of a page.',
                ),
                OnboardingPage(
                  image: 'assets/Onboarding Illustration-3.png',
                  title: 'Education is the best learn ever',
                  subtitle:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                ),
              ],
            ),
            // Bottom white container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 309,
                width: 350,
                padding: const EdgeInsets.only(
                    left: 40, right: 30, top: 40, bottom: 40),
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
                    // Title and Subtitle
                    Text(
                      'Education is the best learn ever',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // SmoothPageIndicator
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFFAB1CAF),
                        dotColor: Colors.grey,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Skip and Next buttons
                    Row(
                      mainAxisAlignment: _currentPage == 2
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        // Skip Button (Hidden on last page)
                        if (_currentPage != 2)
                          GestureDetector(
                            onTap: () => _controller.jumpToPage(2),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        // Next Button
                        GestureDetector(
                          onTap: () {
                            if (_currentPage == 2) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage1()),
                              );
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
                            width: _currentPage == 2 ? 280 : 115,
                            decoration: BoxDecoration(
                              color: const Color(0xFFAB1CAF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _buttonText,
                              textAlign: TextAlign.center,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 190),
        Image.asset(image, height: 210),
      ],
    );
  }
}
