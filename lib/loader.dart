import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinuousRotation extends StatefulWidget {
  const ContinuousRotation({super.key});

  @override
  _ContinuousRotationState createState() => _ContinuousRotationState();
}

class _ContinuousRotationState extends State<ContinuousRotation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Adjust the duration as needed
    )..repeat(); // Repeat the animation infinitely
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SvgPicture.asset("images/buscaro_standalone.svg"), // Replace this with your image
    );
  }
}