import 'package:flutter/material.dart';

class index extends StatelessWidget {
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
            Text('Pdfs'),
            Spacer(),
            Icon(Icons.help_outline, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CategoryButton(text: 'Chemistry 101'),
            SizedBox(height: 10),
            CategoryButton(text: 'Physics 101'),
            SizedBox(height: 10),
            CategoryButton(text: 'Mathematics 101'),
            SizedBox(height: 10),
            CategoryButton(text: 'Biology 101'),
            SizedBox(height: 10),
            CategoryButton(text: 'Computer Science 112'),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;

  CategoryButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$text tapped')));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20), // Adjust padding as needed
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lightGreen[300], // Light green color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: index(),
  ));
}
