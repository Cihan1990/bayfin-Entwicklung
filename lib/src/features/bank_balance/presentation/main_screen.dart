import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/presentation/sales_screen.dart';
import 'package:bayfin/src/features/bank_balance/presentation/view_bankaccount.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const MainScreen({super.key, required this.databaseRepository});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewBankaccount(
                              databaseRepository: widget.databaseRepository,
                            )),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                ))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                child: Column(children: [
              const SizedBox(height: 0),
              LogoWidget(width: 217, height: 76),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(width: 10),
                SizedBox(
                  width: 96,
                  height: 20,
                  child: Text(
                    'Guten Tag ',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 6),
                  SizedBox(
                    width: 113,
                    height: 40,
                    child: Text(
                      'Cihan!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: 361,
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalesScreen(
                                    databaseRepository:
                                        widget.databaseRepository)));
                      },
                      child: const Card(
                          color: Color(0xFFD6D7FA),
                          child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(children: [
                                Text(
                                  'Girokonto\n1.890,69€',
                                  textAlign: TextAlign.center,
                                ),
                              ]))))),
              const SizedBox(height: 15),
              Container(
                width: 361,
                height: 226,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/aktienbild.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  width: 361,
                  height: 220,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Letzte Umsätze          ',
                      ),
                      const SizedBox(height: 4),
                      TransactionInfo(
                          firmLogoPath: "assets/images/vodafonelogo.png",
                          amount: -100.00,
                          firmName: "Vodafone"),
                      TransactionInfo(
                          firmLogoPath: "assets/images/hmlogo.png",
                          amount: -80.00,
                          firmName: "H&M"),
                      TransactionInfo(
                          firmLogoPath: "assets/images/amazonlogo.png",
                          amount: -160.00,
                          firmName: "Amazon")
                    ],
                  )),
            ])),
          ),
        ));
  }
}
