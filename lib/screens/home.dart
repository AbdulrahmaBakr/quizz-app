import 'package:flutter/material.dart';
import 'package:quizz_app/screens/quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 47, 74, 141),
            Color.fromRGBO(38, 138, 233, 0.976),
            Color.fromARGB(255, 89, 130, 235),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromRGBO(206, 228, 239, 0.784),
          ),
          // const SizedBox(height: 20),
          const Text(
            'Flutter Quiz',
            style: TextStyle(
                fontSize: 28,
                fontFamily: 'PixelifySans',
                fontWeight: FontWeight.w800),
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 3.0, color: Colors.green),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Quiz()),
              );
            },
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.black45,
              size: 33,
            ),
            label: const Text(
              'Start Quiz !! ',
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
