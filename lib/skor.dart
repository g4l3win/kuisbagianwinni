import 'package:flutter/material.dart';
import 'main.dart';

class ResultsPage extends StatelessWidget {
  final double currentScore;

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
            SizedBox(height: 50),

            // Congratulation Text
            Text(
              'Congratulation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),

            SizedBox(height: 10),

            // Score
            Text(
              'total skor kamu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),

            Text(
              '$currentScore',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40), // Spacing

            //  Button kembali ke memilih tipe soal
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizHomePage()),
                );
              },
              icon: Icon(Icons.refresh),
              label: Text('Latihan lagi'),
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
