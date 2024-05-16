import 'package:flutter/material.dart';

SizedBox customButton(void Function() onPressedCallback) {
  return SizedBox(
    width: double.maxFinite,
    height: 80,
    child: Padding(
      padding: const EdgeInsets.only(top: 16,bottom: 16),
      child: ElevatedButton(
        onPressed: () {
          // call back function
          onPressedCallback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // <-- Radius
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(color: Colors.white, fontFamily: "Poppins Bold"),
        ),
      ),
    ),
  );
}