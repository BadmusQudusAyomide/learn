import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  final List<String> videoThumbnails = List.generate(9, (index) => 'https://via.placeholder.com/150'); // Placeholder URLs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            SizedBox(width: 10),
            Text('Video Lessons'),
            Spacer(),
            Icon(Icons.help_outline, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: videoThumbnails.isNotEmpty // Check if list is not empty
            ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Three items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: videoThumbnails.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle video tap, e.g., play video
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300], // Add background color
                      image: DecorationImage(
                        image: NetworkImage(videoThumbnails[index]),
                        fit: BoxFit.cover,
                        onError: (error, stackTrace) {
                          print("Error loading image: $error"); // Debugging output
                        },
                      ),
                    ),
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            );
          },
        )
            : Center(child: Text('No videos available')), // Fallback message if list is empty
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Video(),
  ));
}
