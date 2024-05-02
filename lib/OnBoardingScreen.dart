import 'package:buscaro_flutter/onBoardingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //this var has 100% of your screen

    var actualPlacement = size.height / 2;

    actualPlacement = actualPlacement + 70;

    var indicator = SmoothPageIndicator(
        controller: controller, // PageController
        count: 3,
        effect: const WormEffect(
            dotColor:  greyLight,
            activeDotColor:  orange,
          dotHeight: 10,
          dotWidth: 10
        ), // your preferred effect
        onDotClicked: (index) {});

    var pageView = PageView(

      controller: controller,
      children: const [
        OnBoardingWidget(),
        OnBoardingWidget(),
        OnBoardingWidget()
      ],
    );
    var stackContainer = Stack(
      alignment: Alignment.center,
      children: [pageView, Positioned(top: actualPlacement, child: indicator)],
    );



    return stackContainer;
  }
}
