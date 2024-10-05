import 'package:flutter/material.dart';
import 'dart:async';
import 'questions.dart';
import 'skor.dart';

class Pilihanganda extends StatefulWidget {
  String subject;
  Pilihanganda({required this.subject});

  @override
  _PilihangandaState createState() => _PilihangandaState();
}

class _PilihangandaState extends State<Pilihanganda> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  // Set pertanyaan dan jawaban untuk materi
  List<Map<String, dynamic>> questionSet = [];

  int currentQuestion = 0; // Tracking the current question

  @override
  void initState() {
    super.initState();
    questionSet =
        Questions.getQuestions(widget.subject); // subject enggak kedetect
    startTimer(); // Start timer
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer
    super.dispose();
  }

  // Start countdown timer
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        _showResultPage(); // Navigasi ke halaman hasil setelah waktu habis
      }
    });
  }

  // Handle jawaban
  void handleAnswer(String selectedAnswer) {
    // Check jawaban benar atau salah
    if (questionSet[currentQuestion]['correctAnswer'] == selectedAnswer) {
      setState(() {
        score++; // Increment score kalau jawaban benar
      });
    }

    // Update nilai based on the score
    setState(() {
      if (score == 1) {
        nilai = 33;
      } else if (score == 2) {
        nilai = 67;
      } else if (score == 3) {
        nilai = 100;
      }

      // Pindah ke pertanyaan berikutnya
      if (currentQuestion < questionSet.length - 1) {
        currentQuestion++; // Go to the next question
      } else {
        _showResultPage(); // Navigasi ke halaman skor hasil
        timer?.cancel(); // Stop timer
      }
    });
  }

  // Show result page
  void _showResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          currentScore: nilai.toDouble(), // Pass nilai to ResultsPage
          subject: widget.subject, // Pass subject to ResultsPage
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B547A),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Color(0xFF3B547A), // Warna background
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
              SizedBox(height: 40),

              // Lightbulb images
              Image.asset(
                'images/lightbulb.png',
                height: 150,
              ),

              SizedBox(height: 20),

              // Tampilkan pertanyaan saat ini
              buildQuestion(
                'Pertanyaan ${currentQuestion + 1} dari 3',
                questionSet[currentQuestion]['question'],
                questionSet[currentQuestion]['options'],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun pertanyaan dan button pilihan ganda
  Widget buildQuestion(
      String questionTitle, String questionText, List<String> answers) {
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
        // Menampilkan button pilihan jawaban
        for (var answer in answers)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildAnswerButton(answer),
          ),
      ],
    );
  }

  // Fungsi membuat button jawaban
  Widget buildAnswerButton(String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            handleAnswer(answer); // Memeriksa jawaban
          },
          child: Text(
            answer,
            style: TextStyle(
              color: Color(0xFF0D47A1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
