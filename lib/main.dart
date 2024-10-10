import 'package:flutter/material.dart';
import 'karo3.dart';
import 'karo2.dart';
import 'karo1.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Screen0(),
      initialRoute: '/',
      routes:{
        '/':(context)=>Karo1(),
        '/first':(context)=>Karo1(),
        '/second':(context)=>Karo2(),
      } ,
    );
  }
}