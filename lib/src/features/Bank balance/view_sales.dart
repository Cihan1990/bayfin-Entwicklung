import 'package:bayfin/src/features/Authentication/presentation/main_screen.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/Authentication/presentation/widget/transaction_info.dart';
import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 29,
          backgroundColor: const Color(0xFFE6E9FF),
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen(),
                    // ));
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen(),
                    // ));
                  },
                  icon: const Icon(
                    Icons.queue,
                    size: 24,
                  )),
            ],
          ),
          leadingWidth: 200,
        ),
        body: Container(
            width: 393,
            height: 852,
            decoration: const BoxDecoration(color: Color(0xFFE6E9FF)),
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
                  Container(
                    width: 361,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF212C95),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Girokonto\n1.890,69€',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: 361,
                      height: 510,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF212C95),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Umsätze',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 15),
                            TransactionInfo(
                                firmLogoPath:
                                    "lib/assets/images/vodafonelogo.png",
                                amount: -100.00,
                                firmName: "Vodafone"),
                            const SizedBox(
                              height: 12,
                            ),
                            TransactionInfo(
                                firmLogoPath: "lib/assets/images/hmlogo.png",
                                amount: -80.00,
                                firmName: "H&M"),
                            const SizedBox(
                              height: 12,
                            ),
                            TransactionInfo(
                                firmLogoPath:
                                    "lib/assets/images/amazonlogo.png",
                                amount: -160.00,
                                firmName: "Amazon"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "lib/assets/images/nikelogo.png",
                                amount: -120.00,
                                firmName: "Nike"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "lib/assets/images/swsglogo.png",
                                amount: -890.00,
                                firmName: "Miete"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath: "lib/assets/images/boschlogo.png",
                                amount: 4500.00,
                                firmName: "Lohn"),
                            const SizedBox(height: 12),
                            TransactionInfo(
                                firmLogoPath:
                                    "lib/assets/images/klarnalogo.png",
                                amount: -250.00,
                                firmName: "Klarna"),
                          ]))
                ])))));
  }
}
