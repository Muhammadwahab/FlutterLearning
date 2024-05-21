import 'package:buscaro_flutter/BookingItemWidget.dart';
import 'package:buscaro_flutter/StartLocationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/notification.svg"),
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: orange),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Where do you want to go?",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins Bold",
                            fontSize: 24),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: StartLocationWidget(
                            "Start Location", "images/pickup.svg"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: StartLocationWidget(
                            "End Location", "images/dropoff.svg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10.0,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Today",
                                            style: TextStyle(
                                                fontFamily: "Poppins Bold"),
                                          ),
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              "images/calender.svg"),
                                        )
                                      ],
                                    ))),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 12),
                                    alignment: Alignment.center,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(6.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10.0,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: Colors.orange,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: const Text(
                                      "Show Routes",
                                      style: TextStyle(
                                          fontFamily: "Poppins Bold",
                                          color: Colors.white),
                                    )))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Booked Rides",
                      style: TextStyle(
                          fontFamily: "Poppins Bold",
                          fontSize: 32,
                          color: Colors.black),
                    )),
                    SvgPicture.asset("images/filter.svg")
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 10,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BookingItemWidget(),
                  );

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
