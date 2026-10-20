import 'dart:math';

import 'package:flutter/material.dart';

import 'flag_card.dart';
import 'gradient_container.dart';

final randomizer = Random();

class FlagScreen extends StatefulWidget {
  const FlagScreen({super.key});

  @override
  State<FlagScreen> createState() =>
      _FlagScreenState();
}

class _FlagScreenState extends State<FlagScreen> {
  final List<String> countries = [
    'Аримения',
    'Франция',
    'Германия',
    'Испания',
    'Россия',
  ];

  final List<String> flags = [
    'assets/images/ar.png',
    'assets/images/fr.png',
    'assets/images/gr.png',
    'assets/images/is.png',
    'assets/images/rs.png',
  ];

  int currentIndex = 0;
  String message = 'Угадай страну по флагу';

  void checkAnswer(String chosen) {
    setState(() {
      if (chosen == countries[currentIndex]) {
        message = 'Верно!';
      } else {
        message =
            'Неверно, это ${countries[currentIndex]}';
      }
    });
  }

  void nextFlag() {
    setState(() {
      currentIndex = randomizer.nextInt(
        countries.length,
      );
      message = 'Угадай страну по флагу';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        color1: const Color.fromARGB(
          255,
          33,
          243,
          243,
        ),
        color2: Colors.indigo,
        color3: const Color.fromARGB(
          255,
          240,
          73,
          157,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlagCard(
                imagePath: flags[currentIndex],
                message: message,
              ),
              const SizedBox(height: 20),

              // Четыре кнопки с вариантами (через TextButton)
              for (String country in countries)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                  child: TextButton(
                    onPressed: () =>
                        checkAnswer(country),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    child: Text(country),
                  ),
                ),

              const SizedBox(height: 20),

              // Кнопка "Следующий флаг" (тоже TextButton)
              TextButton(
                onPressed: nextFlag,
                style: TextButton.styleFrom(
                  foregroundColor:
                      Colors.yellowAccent,
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text(
                  'Следующий флаг',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
