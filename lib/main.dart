import 'package:flutter/material.dart';
import 'quizhomepage.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Materiquiz(),
    );
  }
}

class Materiquiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Pilih Materi kuis',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),

            // Grid View for Menu
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildMenuItem('Database', 'img/database.png', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizHomePage(subject: 'Database'),
                      ),
                    );
                  }),
                  _buildMenuItem('Algoritma', 'img/algorithm.png', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuizHomePage(subject: 'Algoritma'),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun tampilan setiap item di Grid
  Widget _buildMenuItem(String title, String imagePath, {VoidCallback? onTap}) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 80, // Adjust the size of the image
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
