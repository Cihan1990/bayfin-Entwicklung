import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/registrations_text.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/transaction_info.dart';
import 'package:bayfin/src/features/bank_balance/presentation/main_screen.dart';
import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  // Konstruktor
  const SalesScreen({super.key, required this.databaseRepository});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () async {
                    await showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Positioned(
                                    right: -40,
                                    top: -40,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const CircleAvatar(
                                        child: Icon(Icons.close),
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: RegistrationsText(
                                              text: 'Umsatzbezeichnung',
                                              color: Colors.black,
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: RegistrationsText(
                                                text: 'Umsatzsumme',
                                                color: Colors.black)),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ElevatedButton(
                                            child:
                                                const Text('Umsatz hinzufügen'),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.of(context).pop();

                                                _formKey.currentState!.save();
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                  icon: const Icon(
                    Icons.queue,
                    size: 24,
                  )),
            ],
          ),
          leadingWidth: 200,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                    child: Column(children: [
                  const SizedBox(height: 10),
                  LogoWidget(width: 217, height: 76),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: 361,
                    height: 80,
                    child: Text(
                      'Girokonto\n1.890,69€',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: 361,
                      height: 510,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Umsätze',
                            ),
                            const SizedBox(height: 15),
                            TransactionInfo(
                                firmLogoPath: "assets/images/vodafonelogo.png",
                                amount: -100.00,
                                firmName: "Vodafone"),
                            const SizedBox(
                              height: 12,
                            ),
                            TransactionInfo(
                                firmLogoPath: "assets/images/hmlogo.png",
                                amount: -80.00,
                                firmName: "H&M"),
                            const SizedBox(
                              height: 12,
                            ),
                            TransactionInfo(
                                firmLogoPath: "assets/images/amazonlogo.png",
                                amount: -160.00,
                                firmName: "Amazon"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "assets/images/nikelogo.png",
                                amount: -120.00,
                                firmName: "Nike"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "assets/images/swsglogo.png",
                                amount: -890.00,
                                firmName: "Miete"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "assets/images/boschlogo.png",
                                amount: 4500.00,
                                firmName: "Lohn"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "assets/images/klarnalogo.png",
                                amount: -250.00,
                                firmName: "Klarna"),
                          ]))
                ])))));
  }
}
