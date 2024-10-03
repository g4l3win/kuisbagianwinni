import 'package:flutter/material.dart';
import 'statistik.dart';

class Materistat extends StatelessWidget {
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
              'Pilih Materi untuk melihat statistik',
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
                  _buildMenuItem('Mat', Icons.numbers, onTap: () {
                    // Aksi saat 'mat' ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Statistik(subject: 'Mat'),
                      ),
                    );
                  }),
                  _buildMenuItem('IPA', Icons.science, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Statistik(subject: 'IPA'),
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
  Widget _buildMenuItem(String title, IconData icon, {VoidCallback? onTap}) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.black, size: 30), // Tambahkan Icon
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
