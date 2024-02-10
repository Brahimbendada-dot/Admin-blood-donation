import 'package:admin_blood/view/Add/Add.dart';
import 'package:admin_blood/view/Add/AddAdmin.dart';
import 'package:admin_blood/view/Add/addUser.dart';
import 'package:admin_blood/view/Authentification/LogIn.dart';
import 'package:admin_blood/view/DonationApp.dart';
import 'package:admin_blood/view/profile/ProfileDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseMessaging.instance.subscribeToTopic('topic');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonationApp(0),
      routes: {
        "LogIn":(context)=> LogIn(),
        "DonationApp":(context)=>DonationApp(0),
        "Add":(context)=>Add(),
        "AddUser":(context)=>AddUser(),
        "AddAdmin":(context)=>AddAdmin(),
      },
    );
  }
}
