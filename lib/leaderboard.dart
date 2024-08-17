import 'package:flutter/material.dart';

class leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            SizedBox(width: 10),
            Text('Leaderboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
            Text(
              'Top Performers',
              style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  LeaderboardEntry(
                    position: 1,
                    name: 'Alice Johnson',
                    score: 150,
                    avatarUrl: 'https://via.placeholder.com/150',
                  ),
                  LeaderboardEntry(
                    position: 2,
                    name: 'Bob Smith',
                    score: 140,
                    avatarUrl: 'https://via.placeholder.com/150',
                  ),
                  LeaderboardEntry(
                    position: 3,
                    name: 'Charlie Brown',
                    score: 130,
                    avatarUrl: 'https://via.placeholder.com/150',
                  ),
                  LeaderboardEntry(
                    position: 4,
                    name: 'David Wilson',
                    score: 120,
                    avatarUrl: 'https://via.placeholder.com/150',
                  ),
                  LeaderboardEntry(
                    position: 5,
                    name: 'Eva Green',
                    score: 110,
                    avatarUrl: 'https://via.placeholder.com/150',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardEntry extends StatelessWidget {
  final int position;
  final String name;
  final int score;
  final String avatarUrl;

  LeaderboardEntry({
    required this.position,
    required this.name,
    required this.score,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Score: $score pts',
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: position == 1
                ? Colors.amber
                : position == 2
                ? Colors.grey
                : position == 3
                ? Colors.brown
                : Colors.green[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '#$position',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: leaderboard(),
  ));
}
