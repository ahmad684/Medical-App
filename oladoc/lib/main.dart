import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oladoc/Screens/Auth/PhoneLogin.dart';
import 'package:oladoc/Screens/MainScreen.dart';
import 'package:oladoc/Them/Appthem.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
  FirebaseAuth auth=FirebaseAuth.instance;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
 debugShowCheckedModeBanner: false,
      theme: AppThemData(),
      home:MainScreen()
    );
  }
}

