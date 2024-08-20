import 'package:flutter/material.dart';

class TimeBasedGreeting extends StatelessWidget {
  const TimeBasedGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentHour = now.hour;

    String greeting;

    if (currentHour >= 19) {
      greeting = "Guten Abend";
    } else if (currentHour >= 11) {
      greeting = "Guten Tag";
    } else {
      greeting = "Guten Morgen";
    }

    return Text(
      greeting,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
