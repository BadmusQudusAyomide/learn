import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<String> quizTitles = [
    'General Knowledge',
    'Mathematics',
    'Science',
    'History',
    'Geography',
    'Literature',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            SizedBox(width: 10),
            Text('Quiz'),
            Spacer(),
            Icon(Icons.help_outline, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizTitles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to quiz detail page or start quiz
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.quiz,
                      color: Colors.green,
                      size: 40,
                    ),
                    SizedBox(width: 20),
                    Text(
                      quizTitles[index],
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Quiz(),
  ));
}
