import 'dart:async';
import 'dart:convert';

import 'package:buscaro_flutter/Constants.dart';
import 'package:buscaro_flutter/LoginScreen.dart';
import 'package:buscaro_flutter/SharedPrefSingleton.dart';
import 'package:buscaro_flutter/loader.dart';
import 'package:buscaro_flutter/models/testmodule/BuscaroMetaResponse.dart';
import 'package:buscaro_flutter/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'
    as http; // Correct import statement for http package

import 'OnBoardingScreen.dart';
import 'colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey _alertKey = GlobalKey();
  final GlobalKey loaderKey = GlobalKey();

  late Timer _timer;

  Future<BuscaroMetaResponse?> loadData() async {
    var dataURL = Uri.parse('https://api-dev.buscaro.com/api/v1/passengers');

    try {
      http.Response response = await http.get(dataURL);
      return BuscaroMetaResponse.fromJson(
          jsonDecode(response.body), Data.fromJson);
    } catch (ex) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      showLoader(context);
      loadData().then((value) => {
            _timer = Timer(const Duration(seconds: 1), () {
              hideLoader();
              if (value == null) {
                showErrorMessage(context);
              } else {
                if (SharedPrefSingleton().getBool(ON_BOARDING) == true) {
                  print(value.success);
                  if (value.success == false) {
                    showErrorMessage(context);
                  } else {
                    Navigator.of(context)
                        .pushReplacement(_onLoginScreenRoute());
                  }
                } else {
                  if (value.success == false) {
                    showErrorMessage(context);
                  } else {
                    Navigator.of(context).pushReplacement(_onBoardingRoute());
                  }
                  print(value.success);
                }
              }
            })
          });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: orange));
  }

  Route _onBoardingRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const OnBoardingScreen(),
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

  Future<void> showErrorMessage(BuildContext context) {
    return showGeneralDialog(
        // Background color
        barrierDismissible: true,
        barrierLabel: 'Dialog',
        barrierColor: Colors.transparent,
        transitionDuration: const Duration(milliseconds: 1),
        context: context,
        pageBuilder: (context, __, ___) {
          Future.delayed(const Duration(seconds: 3), () {
            print("current laoder is ${_alertKey.currentContext}");
            Navigator.of(context).pop(); // Close the dialog
          });
          return Dialog(
            key: _alertKey,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            alignment: AlignmentDirectional.bottomCenter,
            //this right here
            child: const Wrap(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What do you want to remember?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(
                    begin: const Offset(0, false ? -1 : 1),
                    end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        });
  }

  hideLoader() {
    if (loaderKey.currentContext != null) {
      Navigator.of(context).pop();
    }
  }

  Future<void> showLoader(BuildContext context) {
    return showGeneralDialog(
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',

      context: context,
      pageBuilder: (context, __, ___) {
        var dailog = Dialog(
          key: loaderKey,
          backgroundColor: const Color(0x00ffffff),
          elevation: 0,
          alignment: AlignmentDirectional.center,
          child: const Wrap(
            children: [
              Center(
                child: ContinuousRotation(),
              )
            ],
          ),
        );

        return WillPopScope(
          onWillPop: () async => false,
          child: dailog,
        );
      },
    );
  }
}
