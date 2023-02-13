import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.blue,
                margin: const EdgeInsets.all(20),
                child: Text(
                  'Which NBA team won the NBA Championship six times during the 1990s?',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (() {}),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('True'),
              ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (() {}),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400),
                  child: const Text('False'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
