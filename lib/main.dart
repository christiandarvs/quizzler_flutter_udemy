import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int answeredQuestions = 0;
  List<Icon> scoreKeeper = [];
  int userScore = 0;
  List<bool> answers = [
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    false,
    false
  ];
  bool? userAnswer;
  List<String> questions = [
    'Is Cordyceps Fungus From the Last of Us Real?',
    'Queen Elizabeth II is currently the second longest reigning British monarch.',
    'Alexander Fleming discovered penicillin.',
    'Alaska is the biggest American state in square miles.',
    'Cinderella was the first Disney princess.',
    'There are five different blood groups.',
    'A is the most common letter used in the English language.',
    'There are two parts of the body that can\'t heal themselves.',
    'The Great Wall of China is longer than the distance between London and Beijing.',
    ' M&M stands for Mars and Moordale.'
  ];

  void checkAnswer() {
    if (answers[answeredQuestions] == userAnswer) {
      userScore++;
    }
  }

  int totalQuestions = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: answeredQuestions <= totalQuestions
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: scoreKeeper,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.blue,
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        questions[answeredQuestions],
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (() {
                        userAnswer = true;
                        debugPrint('$userAnswer');
                        debugPrint('Pressed True');
                        debugPrint('$answeredQuestions');
                        setState(() {
                          checkAnswer();
                          if (answeredQuestions <= 9) {
                            answeredQuestions++;
                            scoreKeeper.add(const Icon(
                              Icons.check,
                              color: Colors.green,
                            ));
                          } else {}
                        });
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text('True'),
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (() {
                          userAnswer = false;
                          debugPrint('$userAnswer');
                          debugPrint('Pressed False');
                          debugPrint('$answeredQuestions');
                          setState(() {
                            checkAnswer();

                            if (answeredQuestions <= 9) {
                              answeredQuestions++;
                              scoreKeeper.add(const Icon(
                                Icons.close,
                                color: Colors.red,
                              ));
                            } else {}
                          });
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade400),
                        child: const Text('False'),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Score: $userScore/${questions.length}',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
                    ),
                    TextButton(
                        onPressed: (() {
                          setState(() {
                            answeredQuestions = 0;
                            scoreKeeper.clear();
                            userScore = 0;
                            userAnswer = null;
                          });
                          debugPrint('$userAnswer');
                          debugPrint('Score Keeper: ${scoreKeeper.length}');
                          debugPrint('Answered Questions: $answeredQuestions');
                        }),
                        child: const Text('Retake Quiz')),
                    TextButton(
                        onPressed: (() {
                          SystemNavigator.pop();
                        }),
                        child: const Text('Exit Quiz'))
                  ],
                ),
              ),
      ),
    );
  }
}
