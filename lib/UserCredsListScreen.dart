import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';
import 'UserCreds.dart';
import 'loader.dart';

class UserCredsListScreen extends StatefulWidget {
  const UserCredsListScreen({super.key});

  @override
  State<UserCredsListScreen> createState() => _UserCredsListScreenState();
}



class _UserCredsListScreenState extends State<UserCredsListScreen> {
  var db = FirebaseFirestore.instance;


  late List<UserCreds> userCreds = [];

  late Future<List<UserCreds>> creds;

  @override
  void initState() {
    super.initState();

    creds = _fetchCreds();
  }

  Future<List<UserCreds>> _fetchCreds() async {
    QuerySnapshot querySnapshot = await db.collection(Credentials).orderBy(DATE_TIME).get();
    return querySnapshot.docs
        .map((doc) => UserCreds.fromFirestore(doc))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Creds List'),
        ),
        body: FutureBuilder<List<UserCreds>>(
          future: creds,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No users found.'));
            } else {
              userCreds = snapshot.data!;
              return credsList(userCreds);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddUserDialog,
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ));
  }

  Padding credsList(List<UserCreds> userCreds) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: userCreds.length,
        itemBuilder: (context, index) {


          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      userCreds[index].name.isNotEmpty
                          ? userCreds[index].name[0]
                          : '?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userCreds[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          userCreds[index].password,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _addUserCreds(String name, String password) {
    setState(() {
      if (userCreds.isEmpty) {
        creds = _fetchCreds();
        userCreds.insert(0,UserCreds(name: name, password: password));

      } else {
        userCreds.insert(0,UserCreds(name: name, password: password));
      }
    });
  }

  void _showAddUserDialog() {
    String name = '';
    String password = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User Creds'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'User Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (name.isNotEmpty && password.isNotEmpty) {
                 // showLoader(context);

                  final UserCredential = <String, dynamic>{
                    "username": name,
                    "password": password,
                    DATE_TIME : DateTime.now().millisecondsSinceEpoch,
                    USER_ID : FirebaseAuth.instance.currentUser?.uid
                  };
                  _addUserCreds(name, password);


                  // Perform Firestore operation
                  db.collection(Credentials).add(UserCredential).then(
                        (DocumentReference doc) {

                      print('DocumentSnapshot added with ID: ${doc.id}');
                      //hideLoader();

                    },
                    onError: (err) {
                      // Handle errors from Firestore operation
                      print("Error from Firestore operation: $err");
                      hideLoader();
                    },
                  ).catchError((error) {
                    // Catch network-related errors
                    print("Network error: $error");
                    // Handle the error gracefully, for example, show a message to the user
                    hideLoader();
                  });

                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  hideLoader() {
    if (loaderKey.currentContext != null) {
      Navigator.of(loaderKey.currentContext!).pop();
    }
  }

  Future<void> showLoader(BuildContext context) {
    return showGeneralDialog(
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',

      context: context,
      pageBuilder: (context, __, ___) {
        var dailog = Dialog(
          key: loaderKey,
          backgroundColor: const Color(0x00ffffff),
          elevation: 0,
          alignment: AlignmentDirectional.center,
          child: const Wrap(
            children: [
              Center(
                child: ContinuousRotation(),
              )
            ],
          ),
        );

        return WillPopScope(
          onWillPop: () async => false,
          child: dailog,
        );
      },
    );
  }
}
