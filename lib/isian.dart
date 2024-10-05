import 'package:flutter/material.dart';
import 'dart:async';
import 'skor.dart';

class Isian extends StatefulWidget {
  final String subject; // Accept subject as a parameter
  Isian({required this.subject});

  @override
  _IsianState createState() => _IsianState();
}

class _IsianState extends State<Isian> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  // Set pertanyaan dan jawaban untuk materi database atau algoritma
  List<Map<String, dynamic>> questionSet = [];
  int currentQuestion = 0; // Track current question index

  // Text controller to get user's answer input
  final TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set the question set based on the subject
    if (widget.subject == 'Database') {
      questionSet = [
        {
          'question':
              'Dalam RDBMS, Atribut candidate key yang dipilih untuk mengidentifikasi secara unik setiap kemunculan entitas adalah...',
          'correctAnswer': 'primary key',
        },
        {
          'question':
              'Dalam ERD, Hubungan antar 2 entitas disebut sebagai hubungan derajat 2 atau...',
          'correctAnswer': 'biner',
        },
        {
          'question':
              'Dalam SQL, tipe data karakter digunakan untuk menyimpan string atau sekumpulan karakter dengan panjang tetap adalah...',
          'correctAnswer': 'char',
        }
      ];
    } else if (widget.subject == 'Algoritma') {
      questionSet = [
        {
          'question':
              'Deskripsi berbasis teks dari langkah-langkah algoritma disebut sebagai...',
          'correctAnswer': 'pseudocode',
        },
        {
          'question':
              'Algoritma yang menggunakan pendekatan divide and conquer dikenal sebagai algoritma ...',
          'correctAnswer': 'rekursif',
        },
        {
          'question':
              'Algoritma yang memiliki efisiensi paling baik dalam pengurutan / sorting untuk data yang hampir terurut adalah...',
          'correctAnswer': 'insertion',
        }
      ];
    }

    startTimer(); // Start the timer
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when widget is disposed
    answerController.dispose(); // Dispose controller
    super.dispose();
  }

  // Start the countdown timer
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        _showResultPage(); // Navigate to result page when time runs out
      }
    });
  }

  // Function to handle user's answer submission
  void handleAnswer() {
    String userAnswer =
        answerController.text.trim().toLowerCase(); // Get user's answer

    // Check if the answer is correct
    if (questionSet[currentQuestion]['correctAnswer']?.toLowerCase() ==
        userAnswer) {
      setState(() {
        score++; // Increment score if the answer is correct
      });
    }

    // Update nilai (score)
    setState(() {
      if (score == 1) {
        nilai = 33;
      } else if (score == 2) {
        nilai = 67;
      } else if (score == 3) {
        nilai = 100;
      }

      // Move to the next question or finish quiz
      if (currentQuestion < questionSet.length - 1) {
        currentQuestion++; // Go to the next question
        answerController.clear(); // Clear the text box for the next question
      } else {
        _showResultPage(); // Show the result page after the last question
        timer?.cancel(); // Stop the timer
        timeLeft = 0;
      }
    });
  }

  // Function to show the result page
  void _showResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          currentScore: nilai, // PASS nilai akhir
          subject: widget.subject,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Color(0xFF0D47A1), // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),

              // Display the timer
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  '$timeLeft',
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50),

              // Lightbulb images
              Image.asset(
                'img/lightbulb.png',
                height: 150,
              ),
              SizedBox(height: 20),

              // Display the current question
              buildQuestion(
                'Pertanyaan ${currentQuestion + 1} dari ${questionSet.length}',
                questionSet[currentQuestion]['question'],
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the question and text box for the answer
  Widget buildQuestion(String questionTitle, String questionText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                questionText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),

        // Text box for user's answer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: answerController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan jawaban',
              fillColor: Colors.white,
              filled: true,
            ),
            onSubmitted: (value) {
              handleAnswer(); // Handle answer when submitted
            },
          ),
        ),
        SizedBox(height: 20),

        // Submit button for the answer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            onPressed: () {
              handleAnswer(); // Handle answer when the button is pressed
            },
            child: Text('Kirim Jawaban'),
          ),
        ),
      ],
    );
  }
}
