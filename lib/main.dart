import 'package:flutter/material.dart';
import 'quiz_brain.dart';

Quizbrain quizBrain = Quizbrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper=[];

  void chekAns(bool userPickedAns){
    bool correctAns = quizBrain.getAns();
    setState((){
    if(correctAns==userPickedAns){
      scorekeeper.add(Icon(Icons.check, color: Colors.green));
    }
    else{
      scorekeeper.add(Icon(Icons.close, color: Colors.red));
    }
      quizBrain.nextques();
      });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  quizBrain.nextques();
                  chekAns(true);

                  // setState(() {
                  //   scorekeeper.add(
                  //     const Icon(
                  //       Icons.check,
                  //       color: Colors.green,
                  //     ),
                  //   );
                  // });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  chekAns(false);
                  // setState(() {
                  //   scorekeeper.add(
                  //     const Icon(
                  //       Icons.close,
                  //       color: Colors.red,
                  //     ),
                  //   );
                  // });

                },
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
