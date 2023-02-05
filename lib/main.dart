import 'package:flutter/material.dart';
import 'login/login.dart';
import 'account/account.dart';
import 'credit/credit.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      title: 'Flutter Demo',
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes:
      {
        "/login": (context) => const LoginPage(),
        "/account": (context) => Account(),
        "/credit": (context) => Credit(),
        "/dispatcher": (context) => Dispatcher(),
        "/employee": (context) => Employee(),
        "/shipper": (context) => Shipper(),
        "/transporter": (context) => Transporter(),
      },
    );
  }
}