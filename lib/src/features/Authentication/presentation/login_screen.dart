// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters, non_constant_identifier_names

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFF212C95)),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 288.74,
            child: Container(
              width: 372,
              height: 126,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 372,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD2D2D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 76,
                    child: Container(
                      width: 372,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD2D2D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -13,
            top: 362.24,
            child: SizedBox(
              width: 419,
              height: 54,
              child: Text(
                'Passwort',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x72010000),
                  fontSize: 10,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 216,
            top: 402.74,
            child: SizedBox(
              width: 177,
              height: 54,
              child: Text(
                'Passwort vergessen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6000000238418579),
                  fontSize: 10,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: -13,
            top: 286.74,
            child: SizedBox(
              width: 419,
              height: 54,
              child: Text(
                'Benutzername /  Telefonnummer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x72010000),
                  fontSize: 10,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 167,
            top: 556,
            child: SizedBox(
              width: 59,
              height: 54,
              child: Text(
                'Oder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFCBD5E3),
                  fontSize: 10,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 150,
            top: 478,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFFD3D3D3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xA5000000),
                    blurRadius: 15,
                    offset: Offset(0, 15),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -2.50,
            top: 59,
            child: Container(
              width: 385,
              height: 136,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/385x136"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 753,
            child: Container(
              width: 361,
              child: Stack(
                children: [
                  Positioned(
                    left: 241,
                    top: 0,
                    child: Container(
                      width: 120,
                      height: 31,
                      padding: const EdgeInsets.all(16),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Registrieren',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 2,
                    child: SizedBox(
                      width: 232,
                      height: 29,
                      child: Text(
                        'Du hast noch keinen Account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 17,
            top: 606,
            child: Container(
              padding: const EdgeInsets.only(left: 61, right: 60),
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x2A000000),
                    blurRadius: 3,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(color: Colors.black),
                          child: FlutterLogo(),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Sign In with Apple',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 17,
            top: 680,
            child: Container(
              width: 345,
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 51.50),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x2A000000),
                    blurRadius: 3,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(color: Colors.white),
                          child: FlutterLogo(),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Sign In with Google',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5400000214576721),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 854,
            child: Container(
              width: 393,
              height: 521,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 393,
                      height: 521,
                      decoration: BoxDecoration(color: Color(0xFFD0D0D0)),
                    ),
                  ),
                  Positioned(
                    left: 155,
                    top: 486,
                    child: SizedBox(
                      width: 84,
                      height: 20,
                      child: Text(
                        'Face ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 8,
                    child: SizedBox(
                      width: 103,
                      height: 31,
                      child: Text(
                        'Apple-ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287,
                    top: 12,
                    child: SizedBox(
                      width: 97,
                      height: 19,
                      child: Text(
                        'Abbrechen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1A73E8),
                          fontSize: 18,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 161,
                    top: 49,
                    child: Container(
                      width: 72,
                      height: 72.72,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/72x73"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    top: 138,
                    child: SizedBox(
                      width: 365,
                      height: 49,
                      child: Text(
                        'Erstelle für BAYFin einen Account mit deiner Apple-ID “Cihan.52@hotmail.de”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.69,
                    top: 215,
                    child: SizedBox(
                      width: 87,
                      height: 23,
                      child: Text(
                        'Name:',
                        style: TextStyle(
                          color: Color(0xFF9D9D9D),
                          fontSize: 16,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.69,
                    top: 267,
                    child: SizedBox(
                      width: 87,
                      height: 23,
                      child: Text(
                        'E-Mail:',
                        style: TextStyle(
                          color: Color(0xFF9D9D9D),
                          fontSize: 16,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 103,
                    top: 214,
                    child: SizedBox(
                      width: 159,
                      height: 18,
                      child: Text(
                        'Cihan Özdemir',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 103,
                    top: 253,
                    child: SizedBox(
                      width: 215,
                      height: 133,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'E-Mail Adresse teilen\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Cihan.52@hotmail.de\n',
                              style: TextStyle(
                                color: Color(0xFFA4A4A4),
                                fontSize: 15,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '\nE-Mail Adresse verbergen\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Weiterleiten an:\nCihan.52@hotmail.de',
                              style: TextStyle(
                                color: Color(0xFF9D9D9D),
                                fontSize: 15,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 353,
                    top: 218,
                    child: Text(
                      '􀀳',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 353,
                    top: 277,
                    child: Text(
                      '􀀀',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 353,
                    top: 335,
                    child: Text(
                      '􀀀',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 166,
                    top: 408,
                    child: Text(
                      '􀎽',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1A73E8),
                        fontSize: 50,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 7,
            top: 859,
            child: SizedBox(
              width: 374,
              height: 503,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 374,
                      height: 503,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33FFFFFF),
                            blurRadius: 1,
                            offset: Offset(0, 4),
                            spreadRadius: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 61,
                    top: 173,
                    child: Container(
                      width: 252,
                      height: 278,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 5,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145,
                    top: 205,
                    child: Container(
                      width: 66,
                      height: 82,
                      decoration: ShapeDecoration(
                        color: Color(0xFFE1E1E1),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 201,
                    child: Container(
                      width: 87,
                      height: 89,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/87x89"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 312,
                    child: Container(
                      width: 194,
                      height: 37,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Color(0xFFA8A8A8)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 358,
                    child: Container(
                      width: 194,
                      height: 31,
                      decoration: BoxDecoration(
                        color: Color(0xFF4CE225),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF585858),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    top: 24,
                    child: Container(
                      width: 145,
                      height: 49,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/bayfinlogo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 110,
                    top: 302,
                    child: SizedBox(
                      width: 136,
                      height: 55,
                      child: Text(
                        'E-Mail Adresse',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x72010000),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 128,
                    top: 361,
                    child: SizedBox(
                      width: 99,
                      height: 25,
                      child: Text(
                        'Weiter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 132,
                    top: 398,
                    child: SizedBox(
                      width: 95,
                      height: 25,
                      child: Text(
                        'Zurück',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x72010000),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          LoginButton()
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Passwort',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0x72010000),
          fontSize: 10,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
      Text('Passwort vergessen',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6000000238418579),
            fontSize: 10,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            height: 0,
          )),
      Text('Benutzername /  Telefonnummer',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0x72010000),
            fontSize: 10,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            height: 0,
          )),
      Text('Oder',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFCBD5E3),
            fontSize: 10,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            height: 0,
          )),
      Text('Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w700,
            height: 0,
          )),
      Text('Registrieren',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            height: 0,
          )),
      Text('Du hast noch keinen Account?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            height: 0,
          )),
      Text('Sign In with Apple',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('Sign In with Google',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5400000214576721),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('Face ID',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('Apple-ID',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
            height: 0,
          )),
      Text('Abbrechen',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1A73E8),
            fontSize: 18,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            height: 0,
          )),
      Text(
          'Erstelle für BAYFin einen Account mit deiner Apple-ID “Cihan.52@hotmail.de”',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('Name:',
          style: TextStyle(
            color: Color(0xFF9D9D9D),
            fontSize: 16,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('E-Mail:',
          style: TextStyle(
            color: Color(0xFF9D9D9D),
            fontSize: 16,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('Cihan Özdemir',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text.rich(TextSpan(
        children: [
          TextSpan(
            text: 'E-Mail Adresse teilen\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          TextSpan(
            text: 'Cihan.52@hotmail.de\n',
            style: TextStyle(
              color: Color(0xFFA4A4A4),
              fontSize: 15,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          TextSpan(
            text: '\nE-Mail Adresse verbergen\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          TextSpan(
            text: 'Weiterleiten an:\nCihan.52@hotmail.de',
            style: TextStyle(
              color: Color(0xFF9D9D9D),
              fontSize: 15,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      )),
      Text('􀀳',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9D9D9D),
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('􀀀',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9D9D9D),
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('􀀀',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9D9D9D),
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
      Text('􀎽',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1A73E8),
            fontSize: 50,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            height: 0,
          )),
      Text('E-Mail Adresse',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0x72010000),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          )),
      Text('Weiter',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            height: 0,
          )),
      Text(
        'Zurück',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0x72010000),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      )
    ]);
  }
}
