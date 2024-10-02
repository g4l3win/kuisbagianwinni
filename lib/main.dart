import 'package:flutter/material.dart';
import 'package:quiz/isian.dart';
import 'package:quiz/pilihanganda.dart';
import 'benarsalah.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xFF0D47A1), // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),

            // gambar start
            Image.asset(
              'img/starting.png',
              height: 150,
            ),
            SizedBox(height: 30),

            // text besar
            Text(
              "Sudah siap?",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Subtitle Text
            Text(
              "Pilih soal pilihan ganda atau soal benar salah atau soal esai!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),

            // Button pilgan
            SizedBox(
              width: double.infinity, // Make the button take full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pilihanganda()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Soal Pilihan Ganda",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D47A1), // warna teks Button
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Button benar salah
            SizedBox(
              width: double.infinity, // Make the button take full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Benarsalah()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background button warna
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Soal Benar Salah",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D47A1), // warna teks button
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Button soal isian
            SizedBox(
              width: double.infinity, // button jadi lebar
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Isian()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background button warna
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Soal Isian",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D47A1), // warna teks button
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            //tombol buat ke statistik sementara nanti hapus
            SizedBox(
              width: double.infinity, // button jadi lebar
              child: ElevatedButton(
                onPressed: () {
                  //ke halaman opsi matkul yang mau dilihat statistiknya
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background button warna
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "statistik",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D47A1), // warna teks button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
