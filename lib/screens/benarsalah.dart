import 'package:flutter/material.dart';
import 'questions.dart'; // Import the questions class
import 'dart:async';
import 'skor.dart';

class Benarsalah extends StatefulWidget {
  final String subject; // Terima subjek dari halaman sebelumnya
  Benarsalah({required this.subject});

  @override
  _Benarsalah createState() => _Benarsalah();
}

class _Benarsalah extends State<Benarsalah> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  List<Map<String, dynamic>> questionSet = [];
  int currentQuestion = 0; // Tracking the current question

  @override
  void initState() {
    super.initState();
    // Mengambil soal berdasarkan subjek yang dipilih
    questionSet = BenarSalahQuestions.getBenarSalahQuestions(widget.subject);

    startTimer(); // Start timer ketika kuis dimulai
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer ketika widget dihancurkan
    super.dispose();
  }

  // Fungsi untuk memulai countdown timer
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

  // Fungsi untuk memeriksa jawaban
  void handleAnswer(String selectedAnswer) {
    if (questionSet[currentQuestion]['correctAnswer'] == selectedAnswer) {
      setState(() {
        score++; // Tambah skor jika jawaban benar
      });
    }

    // Update nilai berdasarkan skor
    setState(() {
      if (score == 1) {
        nilai = 33;
      } else if (score == 2) {
        nilai = 67;
      } else if (score == 3) {
        nilai = 100;
      }

      // Jika masih ada pertanyaan lanjutkan ke pertanyaan berikutnya
      if (currentQuestion < questionSet.length - 1) {
        currentQuestion++;
      } else {
        _showResultPage(); // Jika sudah selesai, navigasi ke halaman hasil
        timer?.cancel(); // Stop timer
      }
    });
  }

  // Navigasi ke halaman hasil
  void _showResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          subject: widget.subject,
          currentScore: nilai.toDouble(), // Pass nilai ke halaman hasil
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
          padding: EdgeInsets.all(30),
          color: Color(0xFF3B547A), // Warna background
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // Tampilkan timer
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

              // Menampilkan gambar lightbulb
              Image.asset(
                'images/lightbulb.png',
                height: 150,
              ),

              SizedBox(height: 20),

              // Tampilkan pertanyaan saat ini
              buildQuestion(
                'Pertanyaan ${currentQuestion + 1} dari ${questionSet.length}',
                questionSet[currentQuestion]['question'],
                questionSet[currentQuestion]['options'],
              ),
              SizedBox(height: 200),
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

  // Fungsi untuk membuat button jawaban
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
            handleAnswer(answer); // Periksa jawaban ketika ditekan
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
