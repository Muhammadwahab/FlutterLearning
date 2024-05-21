import 'package:buscaro_flutter/DropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartLocationWidget extends StatelessWidget {
   StartLocationWidget(this.title, this. image, {super.key});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 8.0),
          // Expanded(
          //     child: Text(
          //   maxLines: 1,
          //       title,
          //   style: TextStyle(
          //     color: Colors.grey.shade700,a
          //     fontSize: 16.0,
          //   ),
          // )),
          // const SizedBox(width: 8.0),

         Expanded(child:
         DropdownButtonExample()),
        ],
      ),
    );
  }
}
