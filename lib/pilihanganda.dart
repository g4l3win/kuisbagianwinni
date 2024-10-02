import 'package:flutter/material.dart';
import 'skor.dart';

class Pilihanganda extends StatefulWidget {
  @override
  _PilihangandaState createState() => _PilihangandaState();
}

class _PilihangandaState extends State<Pilihanganda> {
  int score = 0;

  // Correct answers for each question
  final Map<int, String> correctAnswers = {
    1: 'pilihan 4', // Correct answer for question 1
    2: 'China', // Correct answer for question 2
    3: 'Mars', // Correct answer for question 3
  };

  // Keep track of which question the user is on
  int currentQuestion = 1;

  // Handle user's answer selection
  void handleAnswer(String selectedAnswer) {
    // Check if the selected answer is correct
    if (correctAnswers[currentQuestion] == selectedAnswer) {
      setState(() {
        score++; // Increment the score for correct answer
      });
    }

    // Move to the next question or finish quiz
    setState(() {
      if (currentQuestion < 3) {
        currentQuestion++; // Go to the next question
      } else {
        // If it's the last question, navigate to the ResultsPage
        _showResultPage();
      }
    });
  }

  // Navigate to the ResultsPage
  void _showResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          currentScore: score, // Pass the score to ResultsPage
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Color(0xFF0D47A1), // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the score
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  '$score',
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 80),

              // Lightbulb imagess
              Image.asset(
                'img/lightbulb.png',
                height: 150,
              ),

              SizedBox(height: 20),

              // Display the current question
              if (currentQuestion == 1) ...[
                buildQuestion(
                  'Pertanyaan 1 dari 3',
                  'Which one of these tanks was designed and operated by the United Kingdom?',
                  ['pilihan 1', 'pilihan 2', 'Pilihan 3', 'pilihan 4'],
                ),
              ] else if (currentQuestion == 2) ...[
                buildQuestion(
                  'Pertanyaan 2 dari 3',
                  'Which one of these countries has the largest population?',
                  ['China', 'India', 'USA', 'Brazil'],
                ),
              ] else if (currentQuestion == 3) ...[
                buildQuestion(
                  'Pertanyaan 3 dari 3',
                  'Which one of these planets is known as the Red Planet?',
                  ['Earth', 'Jupiter', 'Mars', 'Venus'],
                ),
              ],
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the question and answer buttons
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
        // Display the answer buttons
        for (var answer in answers)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildAnswerButton(answer),
          ),
      ],
    );
  }

  // Function to build answer buttons
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
            handleAnswer(answer); // Check the answer when button is pressed
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
