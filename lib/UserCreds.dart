import 'package:cloud_firestore/cloud_firestore.dart';

import 'encrption/EncrptionHelper.dart';

class UserCreds {
   String name;
   String password;
  final DocumentReference<Object?>? reference;

  UserCreds(
      {required this.name, required this.password, required this.reference});

  factory UserCreds.fromFirestore(DocumentSnapshot doc, String key) {
    Map data = doc.data() as Map<String, dynamic>;
    var password = EncryptionHelper.decryptText(data['password'] ?? '', key);
    return UserCreds(
        name: data['username'] ?? '',
        password: password,
        reference: doc.reference);
  }
}
