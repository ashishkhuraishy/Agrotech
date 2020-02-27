import 'package:agrotech/Screens/Auth/login.dart';
import 'package:agrotech/Screens/Auth/signup.dart';
import 'package:agrotech/Screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
      routes: {
        Login.id : (context) => Login(),
        SignUp.id : (context) => SignUp(),
      },
    );
  }
}

