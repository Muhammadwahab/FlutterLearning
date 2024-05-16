import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer(
      {super.key, required this.updateResend, required this.startCounter});

  final VoidCallback updateResend;
  final bool startCounter;

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  void onPressed() {
    widget.updateResend();
  }

  @override
  void initState() {
    super.initState();
    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30), // Adjust the duration as needed
    ); // Repeat the animation infinitely

    _startCountdown();
    _controller.addStatusListener((status) {
      print("status  is  ${status}");

      if (status == AnimationStatus.dismissed) {
        print("status complete is  ${status}");
        onPressed();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller when done
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startCounter == false && widget.startCounter == true) {
      _startCountdown();
    }
    // _startCountdown();
  }

  void _startCountdown() {
    _controller.reset();
    _controller.reverse(from: 30.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Center(
                child: Text(
                  timerString,
                  style: const TextStyle(
                      fontFamily: "Poppins Bold", color: Colors.grey),
                ),
              ));
        });
  }

  String get timerString {
    Duration duration = _controller.duration! * _controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
