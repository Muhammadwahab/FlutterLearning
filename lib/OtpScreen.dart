import 'package:buscaro_flutter/CountDownTimer.dart';
import 'package:buscaro_flutter/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CustomViews.dart';
import 'PasswordListing.dart';
import 'colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  void changeResendButton() {
    setState(() {
      isResendEnable = !isResendEnable;
      if (isResendEnable == false) {
        startCounterAgain = true;
      } else {
        startCounterAgain = false;
      }
    });
  }

  void startCounter() {
    setState(() {
      startCounterAgain = !startCounterAgain;
    });
  }

  bool isResendEnable = false;
  bool startCounterAgain = true;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> _focusNodes = [];

  @override
  Widget build(BuildContext context) {
    var resendColor = isResendEnable ? Colors.orange : Colors.grey;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 121.0),
                  child: SvgPicture.asset("images/buscaro_standalone.svg",
                      width: 59, height: 59),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Verify OTP",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: "Poppins Bold",
                        fontSize: 32,
                        color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    "Enter the code send to your Mobile Number",
                    style: TextStyle(
                        fontFamily: "Poppins Regular",
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 4,
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      _otpTextField(context, true, 0),
                      _otpTextField(context, false, 1),
                      _otpTextField(context, false, 2),
                      _otpTextField(context, false, 3),
                      _otpTextField(context, false, 4),
                      _otpTextField(context, false, 5),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Wrong OTP",
                      style: TextStyle(
                          fontFamily: "Poppins Bold", color: Colors.grey),
                    ),
                  ),
                ),
                CountDownTimer(
                  startCounter: startCounterAgain,
                  updateResend: changeResendButton,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      const Text(
                        "If you didn’t recieve a code?",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins Bold",
                            color: Colors.grey),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: TextButton(
                            onPressed:
                                isResendEnable ? resendButtonPressed : null,
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins Bold",
                                  color: resendColor),
                            ),
                          )),
                    ],
                  ),
                ),
                customButton(() {
                  Navigator.of(context).pushReplacement(_onPasswordListing());
                  // print("Login button click");
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resendButtonPressed() {
    changeResendButton();
    // startCounter();
  }

  Widget _otpTextField(BuildContext context, bool autoFocus, int index) {
    return SizedBox(
      width: 54,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        cursorColor: Colors.orange,
        cursorRadius: const Radius.circular(5),
        cursorWidth: 3,
        decoration: const InputDecoration(
            counterText: "",
            errorText: null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 2, color: editTextBorder),
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffd8d6de))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffd8d6de))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: error)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(width: 1, color: Colors.red)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 2, color: editTextBorder),
            )),
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontFamily: "Poppins Bold", fontSize: 22, color: Colors.black),
        maxLines: 1,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              FocusScope.of(context).nextFocus();
            }
          } else if (value.isEmpty) {
            //FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(6, (_) => FocusNode());

    for (int i = 0; i < 6; i++) {
      _focusNodes[i].addListener(() {
        _focusNodes[i].onKeyEvent = (node, event) {
          if (i - 1 < 0) {
            return KeyEventResult.ignored;
          }
          if (event.logicalKey == LogicalKeyboardKey.backspace &&
              event is KeyUpEvent) {
            if (_controllers[i].value.text.isEmpty) {
              _focusNodes[i - 1].previousFocus();
            }
            return KeyEventResult.ignored;
          }
          return KeyEventResult.ignored;
        };
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Route _onHomeRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
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


  Route _onPasswordListing() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const PasswordListing(),
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
