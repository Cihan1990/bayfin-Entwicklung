// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Container(
            width: 385,
            height: 136,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bayfinlogo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ));
  }
}
