// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/screens/quiz.dart';

class Result extends StatefulWidget {
  Result({
    Key? key,
    this.score,
    required this.answers,
  }) : super(key: key);
  final int? score;
  final List answers;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // ignore: prefer_typing_uninitialized_variables
  var rightAnswers;
  final List rightAnswersArr = [];

  void showRightAnswers() {
    for (int i = 0; i < 6; i++) {
      rightAnswers = questions[i].answer[0];
      setState(() {
        rightAnswersArr.add(rightAnswers);
      });
      log(rightAnswersArr.toString());
    }
  }

  // final rightAnswers = questions[3].answer[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 900,
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
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                ' Result : ${widget.score} of 6',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                    fontSize: 35, color: const Color.fromARGB(255, 63, 56, 34)),
              ),
            ),
            ...widget.answers.map(
              (e) => Column(
                children: [
                  Text(
                    e,
                    style: GoogleFonts.asar(fontSize: 18),
                  ),
                ],
              ),
            ),
            OutlinedButton.icon(
              label: const Text(
                'right Answers',
                style: TextStyle(color: Colors.black38, fontSize: 22),
              ),
              icon: const Icon(
                Icons.arrow_circle_down,
                color: Colors.black,
              ),
              onPressed: showRightAnswers,
            ),
            ...rightAnswersArr.map(
              (e) => Text(
                '$e',
                style: GoogleFonts.aldrich(
                  fontSize: 20,
                ),
              ),
            ),
            OutlinedButton.icon(
              label: const Text(
                'Repeate Quiz',
                style: TextStyle(color: Colors.black38, fontSize: 22),
              ),
              icon: const Icon(
                Icons.repeat,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Quiz()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
