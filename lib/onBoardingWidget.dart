import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'Constants.dart';
import 'LoginScreen.dart';
import 'SharedPrefSingleton.dart';
import 'colors.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: orange,
        child: Column(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Container(
                  child: SvgPicture.asset(
                "images/buscaro_splas_logo.svg",
                alignment: Alignment.bottomCenter,
              )),
            ),
            const Spacer(),
            Flexible(
              flex: 4,
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Text(
                        "Easiest Way \n To Find Transport",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontFamily: 'Poppins Bold'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 16, right: 16),
                      child: Text(
                        "Lorem Ipsum has been the industry's standard dummy text",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Poppins Regular'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 16, right: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          SharedPrefSingleton().putBool(ON_BOARDING, true);
                          Navigator.of(context)
                              .pushReplacement(_onLoginScreenRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(6), // <-- Radius
                          ),
                        ),
                        child: const Text(
                          'Button',
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Poppins Bold"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Route _onLoginScreenRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}
