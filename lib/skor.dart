import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final int currentScore;

  ResultsPage({
    required this.currentScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50), // Adjust spacing

            // Congratulation Text
            Text(
              'Congratulation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),

            SizedBox(height: 10), // Spacing

            // Score
            Text(
              'Your Score is',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),

            Text(
              '$currentScore / 3',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40), // Spacing

            // Start Again Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Go back to start quiz again
              },
              icon: Icon(Icons.refresh),
              label: Text('Start Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button color

                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
