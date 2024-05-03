import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                "Welcome To \nBuscaro!",
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
                "We will give you our best and save transport.",
                style: TextStyle(
                    fontFamily: "Poppins Regular",
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            customTextField()
          ],
        ),
      ),
    );
  }

  Padding customTextField() {
    return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 16,bottom: 16),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: flagAndDivider(),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 19,
                  minHeight: 13,
                ),
                hintText: 'Enter Mobile Number',
                hintStyle: const TextStyle(
                    color: hintColor,
                    fontSize: 14,
                    fontFamily: "Poppins Regular"),
                errorStyle: const TextStyle(fontSize: 12),
                errorText: "Invalid Phone Number",
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(width: 1, color: editTextBorder),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(width: 1, color: editTextBorder),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(width: 1, color: editTextBorder),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(width: 1, color: Colors.red)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(width: 1, color: Colors.red)),
              ),
            ),
          );
  }

  Widget flagAndDivider() {
    return IntrinsicHeight(
        child: SizedBox(
      width: 90,
      child: Row(
        children: [
          Image.asset("images/flag.png"),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              "+92",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins Regular",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: VerticalDivider(
              width: 2,
              thickness: 2,
              color: Colors.black,
            ),
          ), // This is divider
        ],
      ),
    ));
  }
}
