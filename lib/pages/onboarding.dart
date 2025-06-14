import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "Page 1: Welcome & Core Value",
      "subtitle": "Purpose: Greet users, introduce the app’s primary value, and set a friendly tone.",
    },
    {
      "title": "Page 2: Key Features Highlight",
      "subtitle": "Purpose: Showcase core app features to familiarize users with functionality and encourage exploration.",
    },
    {
      "title": "Page 3: Personalization & Activation",
      "subtitle": "Purpose: Prompt users to take a first action (e.g., connect their AC or set preferences) to drive activation and engagement.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPage(),
          if (_currentIndex < _pages.length - 1) _skipBtn(),
          _bottomDots(),
        ],
      ),
    );
  }

  Widget _buildPage() {
    return PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      onPageChanged: (index) => setState(() => _currentIndex = index),
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: _pageAt(index),
      ),
    );
  }

  Widget _pageAt(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_pages[index]["title"]!, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Text(_pages[index]["subtitle"]!, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        SizedBox(height: 40),
        if (index == _pages.length - 1) ElevatedButton(
          onPressed: _skip,
          child: Text("Get Started"),
        )
      ],
    );
  }

  Widget _skipBtn() {
    return Positioned(
      top: 50,
      right: 20,
      child: TextButton(onPressed: _skip, child: Text("Skip")),
    );
  }

  Widget _bottomDots() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_pages.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _currentIndex == index ? Colors.blue : Colors.grey,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }

  void _skip() {
    Future.delayed(const Duration(milliseconds: 500), () => _controller.jumpTo(0));
    Navigator.pushNamed(context, '/login');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
