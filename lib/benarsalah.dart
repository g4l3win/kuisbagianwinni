import 'package:flutter/material.dart';
import 'dart:async';
import 'skor.dart';

class Benarsalah extends StatefulWidget {
  final String subject; // terima matkul
  Benarsalah({required this.subject}); // Missing semicolon added

  @override
  _Benarsalah createState() => _Benarsalah();
}

class _Benarsalah extends State<Benarsalah> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  // Keep track sedang pertanyaan keberapa
  int currentQuestion = 0;

  // set pertanyaan dan jawaban untuk materi database atau algoritma
  List<Map<String, dynamic>> questionSet = [];

  @override
  void initState() {
    super.initState();
    if (widget.subject == 'Database') {
      questionSet = [
        {
          'question':
              'Atribut adalah properti yang menggambarkan beberapa aspek dari objek yang ingin kita rekam, dan hubungan adalah asosiasi antar entitas',
          'options': [
            'Benar',
            'Salah',
          ],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'DBMS adalah perangkat unak yang berinteraksi dengan program aplikasi pengguna dan database.',
          'options': [
            'Benar',
            'Salah',
          ],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'dalam DBMS diperlukan Bahasa untuk mendefinisikan database (menentukan tipe, struktur data dan constraint data dalam database yang disebut Data manipulation language (DML)',
          'options': [
            'Benar',
            'Salah',
          ],
          'correctAnswer': 'Salah',
        }
      ];
    } else if (widget.subject == 'Algoritma') {
      questionSet = [
        {
          'question':
              'dalam flowchart, symbol berbentuk belah ketupat biasanya digunakan untuk merepresentasikan keputusan tau percabangan.',
          'options': [
            'Benar',
            'Salah',
          ],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'tipe data int adalah tipe data yang tepat untuk menyimpan nilai jumlah penduduk pada sebuah kota',
          'options': [
            'Benar',
            'Salah',
          ],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'jika nilai i = 5 if (i > 3 && i < 10) {printf("Benar\n");} maka akan tidak akan muncul output.',
          'options': [
            'Benar',
            'Salah',
          ],
          'correctAnswer': 'Salah',
        }
      ];
    }

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
        _showResultPage(); // navigasi ke halaman hasil setelah waktu habis
      }
    });
  }

  // Handle jawaban
  void handleAnswer(String selectedAnswer) {
    // Check cek jawaban benar atau salah
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
      backgroundColor: Color(0xFF0D47A1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Color(0xFF0D47A1), // warna background
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

              // Lightbulb image
              Image.asset(
                'img/lightbulb.png',
                height: 150,
              ),

              SizedBox(height: 20),

              // Display pertanyaan
              buildQuestion(
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

  // Fungsi membuat pertanyaan dan button jawaban
  Widget buildQuestion(String questionText, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            questionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),

        // Display answer buttons
        for (var option in options)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildAnswerButton(option),
          ),
      ],
    );
  }

  // Function untuk answer buttons
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
            handleAnswer(answer); // cek jawaban saat button ditekan
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
