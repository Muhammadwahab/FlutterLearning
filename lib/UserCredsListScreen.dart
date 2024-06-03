import 'package:buscaro_flutter/encrption/EncrptionHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    QuerySnapshot querySnapshot = await db
        .collection(Users)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection(Credentials)
        .orderBy(DATE_TIME, descending: true)
        .get();
    return querySnapshot.docs
        .map((doc) => UserCreds.fromFirestore(
            doc, FirebaseAuth.instance.currentUser!.uid))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Creds List'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                },
              )
            ],
            automaticallyImplyLeading: false),
        body: FutureBuilder<List<UserCreds>>(
          future: creds,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Credentials found.'));
            } else {
              userCreds = snapshot.data!;
              return credsList(userCreds);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddUserDialog("", "", null, 0);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ));
  }

  Widget credsList(List<UserCreds> userCreds) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListView.builder(
        itemCount: userCreds.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              splashColor: Colors.orange,
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {
                _showAddUserDialog(
                    userCreds[index].name,
                    userCreds[index].password,
                    userCreds[index].reference,
                    index);
                // showErrorMessage(
                //     context, userCreds[index].reference.toString());
              },
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                minVerticalPadding: 0,
                title: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color(0x38B8B8B8),
                  ),
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
                                style: const TextStyle(
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
                        IconButton(
                          onPressed: () {

                            deleteData(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addUserCreds(String name, String password,
      DocumentReference<Object?> documentReference) {
    setState(() {
      if (userCreds.isEmpty) {
        creds = _fetchCreds();
        userCreds.insert(
            0,
            UserCreds(
                name: name, password: password, reference: documentReference));
      } else {
        userCreds.insert(
            0,
            UserCreds(
                name: name, password: password, reference: documentReference));
      }
    });
  }

  void updateCredsData(String name, String password, int index) {
    var credentials = userCreds[index];

    setState(() {
      credentials.name = name;
      credentials.password = password;
    });
  }


  void deleteData(int index) {

    setState(() {

      var credentials = userCreds.removeAt(index);
      credentials.reference?.delete();

    });
  }

  void _showAddUserDialog(String previousName, String previousPassword,
      DocumentReference<Object?>? updatedReference, int index) {
    String name = previousName;
    String password = previousPassword;

    TextEditingController nameController =
        TextEditingController(); // initialize the controller
    // when API gets the data, do this:
    nameController.text = name;

    TextEditingController passwordController =
        TextEditingController(); // initialize the controller
    // when API gets the data, do this:
    passwordController.text = password;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User Creds'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'User Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
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
              child: Text(previousName.isEmpty ? "Add" : "Update"),
              onPressed: () {
                if (name.isNotEmpty && password.isNotEmpty) {
                  // showLoader(context);

                  var dateTime = DateTime.now().millisecondsSinceEpoch;
                  final UserCredential = <String, dynamic>{
                    "username": name,
                    "password": EncryptionHelper.encryptText(
                        password, FirebaseAuth.instance.currentUser!.uid),
                    DATE_TIME: dateTime
                  };
                  // Perform Firestore operation

                  if (updatedReference == null) {
                    var documentReference = db
                        .collection(Users)
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .collection(Credentials)
                        .doc("${Credentials}_$dateTime");

                    documentReference.set(UserCredential);

                    _addUserCreds(name, password, documentReference);

                    Navigator.of(context).pop();
                  } else {
                    updatedReference.set(UserCredential);
                    updateCredsData(name, password, index);
                    Navigator.of(context).pop();
                  }
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
