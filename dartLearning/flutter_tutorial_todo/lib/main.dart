import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/pages/home.dart';
import 'package:flutter_tutorial_todo/pages/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MaterialApp(
    //init the Hive
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        )),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/todo': (context) => Home(),
    },
  ));
}

