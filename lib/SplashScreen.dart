import 'dart:async';
import 'dart:convert';

import 'package:buscaro_flutter/Constants.dart';
import 'package:buscaro_flutter/LoginScreen.dart';
import 'package:buscaro_flutter/SharedPrefSingleton.dart';
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
  late Timer _timer;

  Future<BuscaroMetaResponse> loadData() async {
    var dataURL = Uri.parse('https://api-dev.buscaro.com/api/v1/passengers');
    http.Response response = await http.get(dataURL);
    return BuscaroMetaResponse.fromJson(
        jsonDecode(response.body), Data.fromJson);
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }

  @override
  void initState() {
    super.initState();

    loadData().then((value) => {
          _timer = Timer(const Duration(seconds: 1), () {
            if (SharedPrefSingleton().getBool(ON_BOARDING) == true) {
              Navigator.of(context).pushReplacement(_onLoginScreenRoute());
            } else {
              Navigator.of(context).pushReplacement(_onBoardingRoute());
            }
          })
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
}
