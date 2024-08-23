import 'package:flutter/material.dart';

class TimeBasedGreeting extends StatelessWidget {
  const TimeBasedGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentHour = now.hour;

    String greeting;

    if (currentHour >= 18) {
      greeting = "Guten Abend";
    } else if (currentHour >= 12) {
      greeting = "Guten Tag";
    } else if (currentHour >= 4) {
      greeting = "Guten Morgen";
    } else if (currentHour >= 15) {
      greeting = "Guten Nachmittag";
    } else {
      greeting = "Gute Nacht";
    }

    return Text(
      greeting,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
