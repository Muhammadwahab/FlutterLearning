import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';



class Splash extends StatelessWidget {



  const Splash({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
          color: orange,
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("images/buscaro_splas_logo.svg"),
                const SizedBox(height: 20)
                , // Adding some space between SVG and text
                const Text(textAlign: TextAlign.center,
                  "Wherever your destination, we’ll be your travel partner!",
                  style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Poppins Bold'),
                )
              ],
            ),
          )),
    );

  }


}
