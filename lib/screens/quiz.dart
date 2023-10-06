import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/component/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/screens/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var counter = 1;
  var score = 0;
  var userAnswers = [];

  void answerQues() {
    counter++;
    // log('ques length :${questions.length.toString()}');
    setState(() {
      if (counter == questions.length) {
        log('finished');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Result(score: score,answers: [...userAnswers],)),
        );

        // log('counter ${counter.toString()}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[counter - 1];
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 47, 141, 121),
                Color.fromRGBO(38, 138, 233, 0.976),
                Color.fromARGB(255, 89, 169, 235),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  currentQuestion.questionsTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(
                      fontSize: 28,
                      // fontFamily: 'PixelifySans',
                      fontWeight: FontWeight.w800),
                ),
              ),
              //... to spread list of widget(map) in list of widget(column)
              ...currentQuestion.shuffledAnswers().map(
                    (e) => Container(
                      margin: const EdgeInsets.all(20),
                      child: AnswerButton(
                        data: e,
                        onPressed: () {
                          answerQues();
                          userAnswers.add(e);
                          // log('right answer:${currentQuestion.answer[0]}');
                          // log('chosen answer:$e');
                          currentQuestion.answer[0] == e
                              ? {score++, 'result'}
                              : '';
                          log('result : ${score.toString()}');
                          log('result : ${userAnswers.toString()}');
                        },
                      ),
                    ),
                  ),
              // const Spacer(flex: 1),
              // AnswerButton(answerText: 'Answer 1', onPressed: () {}),
              // const Spacer(flex: 1),
              // AnswerButton(answerText: 'Answer 2', onPressed: () {}),
              // const Spacer(flex: 1),
              // AnswerButton(answerText: 'Answer 3', onPressed: () {}),
              // const Spacer(flex: 1),
              // AnswerButton(answerText: 'Answer 4', onPressed: () {}),
              // const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
