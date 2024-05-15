import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../splash/splashScreen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageContent() {
    return [
      _buildPage(
        imagePath: 'assets/images/onboard1.png',
        text: 'Suivez en illimité vos vidéos préférées traduites dans nos langues locales !',
      ),
      _buildPage(
        imagePath: 'assets/images/onboard2.png',
        text: 'Apprenez en plus sur la culture, l\'histoire du Bénin, avec une simple question.',
        showButton: true,
      ),
    ];
  }

  void _onFinish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    await prefs.setBool('onboarding_completed', true);
    Get.to(SplashScreen());
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 10.0 : 8.0,
      width: isCurrentPage ? 10.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF01986D) : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildPage({required String imagePath, required String text, bool showButton = false}) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(_w * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: _w * 0.8),
          SizedBox(height: _h * 0.02),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: _w * 0.045,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          if (showButton) ...[
            SizedBox(height: _h * 0.04),
            ElevatedButton(
              onPressed: _onFinish,
              child: Text(
                'Commencer',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF01986D),
                padding: EdgeInsets.symmetric(horizontal: _w * 0.1, vertical: _h * 0.02),
              ),
            ),
          ]
        ],
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _buildPageContent(),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _buildPageContent().length,
                    (int index) => _buildPageIndicator(index == _currentPage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
