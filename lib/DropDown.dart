import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 30,

      child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: dropdownValue,
            isExpanded: true,
            hint: const Text("Select Location"),

            style: const TextStyle(color: Colors.black ,fontSize: 16),
            underline: Container(color: Colors.transparent),



            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),

              menuItemStyleData: MenuItemStyleData(),
              dropdownStyleData: DropdownStyleData(
               
                isOverButton: false,
                     //this var has 100% of your screen

            width: MediaQuery.of(context).size.width-30,



                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                offset: const Offset(-45, -20),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(10),
                  thickness: MaterialStateProperty.all(1),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              )
          )
      )
    );
  }

}
