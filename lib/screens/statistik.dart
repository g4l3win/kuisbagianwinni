import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'quiz_data.dart';

class Statistik extends StatefulWidget {
  final String subject;
  const Statistik({Key? key, required this.subject}) : super(key: key);

  @override
  State<Statistik> createState() => _Statistik();
}

class _Statistik extends State<Statistik> {
  // Initial data untuk 'Kuis 1'
  List<int> currentDistribusi = [0, 3, 2, 5]; // distribusi awal untuk Kuis 1
  List<String> quizNames = ['Kuis 1', 'Kuis 2', 'Kuis 3'];

// List tipe quiz
  List<String> quizTypes = ['Pilihan Ganda', 'Isian', 'Benar Salah'];
  String selectedQuizType = 'Pilihan Ganda'; // tipe kuis default

// Fungsi untuk mendapatkan data berdasarkan tipe quiz
  Map<String, List<int>> _getQuizData() {
    if (selectedQuizType == 'Pilihan Ganda') {
      return QuizData.pilihanGandaData;
    } else if (selectedQuizType == 'Isian') {
      return QuizData.isianData;
    } else {
      return QuizData.benarSalahData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00B1C2),
        title: Text(
          'Statistik Nilai Kuis ${widget.subject}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // Row for selecting quiz type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: quizTypes.map((type) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedQuizType = type;
                        currentDistribusi = _getQuizData()['Kuis 1']!;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: selectedQuizType == type
                            ? Color(0xFFFFD801)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedQuizType == type
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: 400, // Set width
              height: 400, // Set height
              child: BarChart(
                BarChartData(
                  //alignment: BarChartAlignment.spaceEvenly,
                  maxY: 7, // Maximum value for Y-axis
                  barGroups: _generateBarGroups(currentDistribusi),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('0');
                            case 1:
                              return const Text('33');
                            case 2:
                              return const Text('67');
                            case 3:
                              return const Text('100');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Total Mahasiswa : 10",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Update the bar chart data when a quiz is selected
                    setState(() {
                      currentDistribusi = _getQuizData()[quizNames[index]]!;
                    });
                  },
                  child: _buildProductItem(quizNames[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Generate BarChartGroupData untuk distribution data saat ini
  List<BarChartGroupData> _generateBarGroups(List<int> distribusi) {
    return List.generate(
      distribusi.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: distribusi[index].toDouble(),
            color: Color(0xFFFFD801),
            width: 20,
          ),
        ],
      ),
    );
  }

  // Function untuk bangun item list kuis
  Widget _buildProductItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF3B547A), // Background color for the item
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        padding: const EdgeInsets.all(16.0), // Add padding
        child: Row(
          children: [
            const SizedBox(width: 10),
            // Left column (quiz name)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ), // White text, blue background
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
