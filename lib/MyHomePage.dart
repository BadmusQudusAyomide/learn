import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoey/index.dart';
import 'package:zoey/Video.dart';
import 'package:zoey/OnboardingPage.dart';
import 'package:zoey/leaderboard.dart';
import 'package:zoey/Quiz.dart'; // Make sure this is the correct import


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 18,
            ),
            SizedBox(width: 10),
            Text('Hi, User Name'),
            Spacer(),
            Icon(Icons.help_outline, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Search', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Continue Studying', style: TextStyle(color: Colors.green)),
                      SizedBox(height: 5),
                      Text('CHM 102', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Text('02-08-2024', style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: (

                            ) {
                          // Add your navigation or action code here
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => index()), // Ensure `Index` is a valid widget
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text('0%', style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('completed', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Categories', style: TextStyle(color: Colors.blue, fontSize: 18)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  CategoryCard(
                    title: 'PDFs',
                    icon: Icons.picture_as_pdf,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => index()), // Ensure `Index` is a valid widget
                      );
                    },
                  ),
                  CategoryCard(title: 'Quiz',
                      icon: Icons.quiz,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Quiz()), // Ensure `Index` is a valid widget
                        );
                      }),
                  CategoryCard(title: 'Leaderboard', icon: Icons.leaderboard, onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => leaderboard()), // Ensure `Index` is a valid widget
                    );
                  }),
                  CategoryCard(title: 'Video lesson', icon: Icons.video_library, onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Video()), // Ensure `Index` is a valid widget
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: 'Ai'),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryCard({required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green, size: 40),
            SizedBox(height: 10),
            Text(title, style: TextStyle(color: Colors.blue, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
