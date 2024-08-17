import 'package:flutter/material.dart';
import 'package:zoey/wrapper.dart';
import 'dart:async';

import 'LoginPage.dart';
import 'MyHomePage.dart';

void main() {
  runApp(MaterialApp(
    home: OnboardingPage(),
  ));
}

// Onboarding Page
class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
        _pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: [
              OnboardingContent(
                image: Icons.school,
                title: 'Welcome to the App',
                description: 'Your journey to learning starts here.',
              ),
              OnboardingContent(
                image: Icons.book,
                title: 'Explore Courses',
                description: 'Browse a wide range of courses and materials.',
              ),
              OnboardingContent(
                image: Icons.quiz,
                title: 'Test Your Knowledge',
                description: 'Take quizzes to assess your understanding.',
              ),
              OnboardingContent(
                image: Icons.leaderboard,
                title: 'Track Your Progress',
                description: 'See how well you’re doing over time.',
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (currentPage > 0) {
                      _pageController.animateToPage(
                        currentPage - 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    'BACK',
                    style: TextStyle(
                      color: currentPage == 0 ? Colors.grey : Colors.green,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: currentPage == index ? 12 : 8,
                      height: currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: currentPage == index ? Colors.green : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                TextButton(
                  onPressed: () {
                    if (currentPage == 3) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Wrapper()), // Navigate to the login page
                      );
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentPage == 3 ? 'START' : 'NEXT',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final IconData image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            image,
            size: 100,
            color: Colors.green,
          ),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Login Page


// Home Page (Placeholder)
