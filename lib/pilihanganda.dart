import 'package:flutter/material.dart';
import 'dart:async';
import 'skor.dart';

class Pilihanganda extends StatefulWidget {
  final String subject; // terima matkul
  Pilihanganda({required this.subject});

  @override
  _PilihangandaState createState() => _PilihangandaState();
}

class _PilihangandaState extends State<Pilihanganda> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  // set pertanyaan dan jawaban untuk materi database atau algoritma
  List<Map<String, dynamic>> questionSet = [];

  int currentQuestion = 0; // ngelacak pertanyaan keberapa

  @override
  void initState() {
    super.initState();
    if (widget.subject == 'Database') {
      questionSet = [
        {
          'question':
              'Bahasa query yang paling umum adalah Structured Query Language atau bisa disebut sebagai',
          'options': [
            'S-Q-L, strukquer',
            'select bintang, S-Q-L',
            'see-Quel, ry-quel',
            'S-Q-L, see-Quel',
          ],
          'correctAnswer': 'S-Q-L, see-Quel',
        },
        {
          'question': 'Apa kelebihan menggunakan DBMS',
          'options': [
            'Mengurangi redudansi data dan meningkatkan konsistensi',
            'hanya bisa sharing data lokal',
            'tidak ada standard penyimpanan data dan sangat fleksibel',
            'sangat aman tapi tidak bisa di-backup',
          ],
          'correctAnswer':
              'Mengurangi redudansi data dan meningkatkan konsistensi',
        },
        {
          'question':
              'Struktur data relasional dalam RDBMS terdiri dari beberapa komponen berikut kecuali',
          'options': [
            'relasi',
            'atribut',
            'hadoop',
            'tuple',
          ],
          'correctAnswer': 'hadoop',
        }
      ];
    } else if (widget.subject == 'Algoritma') {
      questionSet = [
        {
          'question':
              'Dalam bahasa pemrograman, apa yang dimaksud dengan looping?',
          'options': [
            'menjalankan blok kode sekali',
            'mendefinisikan variable',
            'menghapus data dari memori',
            'menjalankan blok kode secara berulang',
          ],
          'correctAnswer': 'menjalankan blok kode secara berulang',
        },
        {
          'question':
              'Ilmu algoritma, namanya terinspirasi dari nama seorang ilmuwan yaitu?',
          'options': [
            'Al-Khawarizmi',
            'Al-Goritma',
            'Al-Khawarits',
            'Al-Gorism',
          ],
          'correctAnswer': 'Al-Khawarizmi',
        },
        {
          'question':
              'Apa yang dimaksud dengan algoritma dalam konteks komputasi?',
          'options': [
            'Sekumpulan simbol matematika',
            'Kumpulan data yang disimpan dalam komputer',
            'Kumpulan instruksi terstruktur untuk menyelesaikan masalah komputasi',
            'Bahasa formal yang digunakan dalam pemrograman',
          ],
          'correctAnswer':
              'Kumpulan instruksi terstruktur untuk menyelesaikan masalah komputasi',
        }
      ];
    }

    startTimer(); // Start timer
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
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
        _showResultPage(); // Navigate ke result page saat waktu habis
      }
    });
  }

  // Handle jawaban
  void handleAnswer(String selectedAnswer) {
    // Check cek jawabat benar atau salah
    if (questionSet[currentQuestion]['correctAnswer'] == selectedAnswer) {
      setState(() {
        score++; // Increment score kalau jawaban benar
      });
    }

//Update nilai berdasarkan skor
    setState(() {
      if (score == 1) {
        nilai = 33;
      } else if (score == 2) {
        nilai = 67;
      } else if (score == 3) {
        nilai = 100;
      }
    });

    // pindah ke pertanyaan berikutnya
    setState(() {
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
          padding: EdgeInsets.all(20),
          color: Color(0xFF0D47A1), // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),

              // Timer
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

              SizedBox(height: 50),
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
