import 'package:flutter/material.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var question = [
    {
      "text": "What is your favourite subject?",
      "answer": [
        {"text": 'subject1', 'score': 3},
        {"text": 'subject2', 'score': 5},
        {"text": 'subject3', 'score': 7},
        {"text": 'subject4', 'score': 10},
      ]
    },
    {
      "text": "What is your favourite movie?",
      "answer": [
        {"text": 'movie1', 'score': 3},
        {"text": 'movie2', 'score': 5},
        {"text": 'movie3', 'score': 7},
        {"text": 'movie4', 'score': 10},
      ]
    },
    {
      "text": "What is your favourite actor?",
      "answer": [
        {"text": 'actor1', 'score': 3},
        {"text": 'actor2', 'score': 5},
        {"text": 'actor3', 'score': 7},
        {"text": 'actor4', 'score': 10},
      ]
    },
    {
      "text": "What is your favourite subject?",
      "answer": [
        {"text": 'subject1', 'score': 3},
        {"text": 'subject2', 'score': 5},
        {"text": 'subject3', 'score': 7},
        {"text": 'subject4', 'score': 10},
      ]
    },
  ];
  int interator = 0;
  int totalscore = 0;
  void gotonextQuestion(int score) {
    setState(() {
      interator++;
      totalscore += score;
    });
    print(interator);
  }

  String get getResult {
    if (totalscore < 15) {
      return "fail";
    }
    return "pass";
  }

  void restartQuiz() {
    setState(() {
      totalscore = 0;
      interator = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            child: (interator < question.length)
                ? Column(
                    children: [
                      Text(question[interator]['text'] as String),
                      ...(question[interator]['answer'] as List<Map>)
                          .map((answer) {
                        return ElevatedButton(
                            onPressed: () => gotonextQuestion(answer['score']),
                            child: Text(answer['text']));
                      }).toList(),
                    ],
                  )
                : Column(
                    children: [
                      Text("Quiz is Completed"),
                      Text(
                          "you are $getResult and your total marks =$totalscore"),
                      ElevatedButton(
                        onPressed: restartQuiz,
                        child: Text("Restart Quiz"),
                      )
                    ],
                  )),
      ),
    );
  }
}
