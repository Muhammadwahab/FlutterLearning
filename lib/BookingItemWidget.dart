import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingItemWidget extends StatefulWidget {
  const BookingItemWidget({super.key});

  @override
  State<BookingItemWidget> createState() => _BookingItemWidgetState();
}

class _BookingItemWidgetState extends State<BookingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return const BusTicket();
  }
}

class BusTicket extends StatelessWidget {
  const BusTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.orange,
        borderRadius: BorderRadius.circular(16.0),
        onTap: (){

        },
        child: Ink(
          padding: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            color: const Color(0xA5CFCFCF),
            borderRadius: BorderRadius.circular(16.0),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black12,
            //     spreadRadius: 1,
            //     blurRadius: 1,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    firstPotion(),
                    secondPortion(),
                    Expanded(
                        child: thirdPortion(
                            "North karachi hello kese ho", "Liyari hello hell0")),
                    priceWidget()
                  ],
                ),
              ),
              Row(

                children: [
                  const FractionalTranslation(
                    translation: Offset(-0.4, 0),
                    child: Icon(Icons.circle, color: Colors.white, size: 30),
                  ),
                  Expanded(child:    Image.asset("images/full_line.png", alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover)),
                  const FractionalTranslation(
                    translation: Offset(0.4, 0),
                    child: Icon(Icons.circle, color: Colors.white, size: 30),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Column firstPotion() {
    return Column(children: [
      const Text(
        'Today',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      dateAndTimeWidget("Depart time", "11:00 AM"),
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: dateAndTimeWidget("Arrived Time", "12:00 AM"),
      )
    ]);
  }

  Container busNumberPlate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.yellow[500],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: const Text(
        'Bus No. 3534',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget priceWidget() {
    return Column(
      children: [
        busNumberPlate(),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                'Rs.\n150',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column dateAndTimeWidget(String label, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, color: Colors.black54)),
        Text(time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget secondPortion() {
    return SizedBox(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Icon(Icons.circle, color: Colors.green, size: 10),
          ),
          SvgPicture.asset(
            "images/separator.svg",
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Icon(Icons.circle, color: Colors.orange, size: 10),
          )
        ],
      ),
    );
  }

  Widget thirdPortion(String firstPlace, String secondOffice) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 45),
          child: Text(
            firstPlace,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: "Poppins Regular"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 115),
          child: Text(
            secondOffice,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: "Poppins Regular"),
          ),
        ),
      ],
    );
  }
}
