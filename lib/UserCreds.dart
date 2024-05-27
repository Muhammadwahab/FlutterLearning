import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreds {
  final String name;
  final String password;

  UserCreds({required this.name, required this.password});


  factory UserCreds.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return UserCreds(
      name: data['username'] ?? '',
      password: data['password'] ?? '',
    );
  }
}