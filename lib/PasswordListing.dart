import 'package:buscaro_flutter/UserCredsListScreen.dart';
import 'package:flutter/material.dart';

class PasswordListing extends StatelessWidget {
  const PasswordListing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UserCredsListScreen(),
    );
  }
}
