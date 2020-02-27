import 'package:agrotech/Screens/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  static String id = "signup_screen";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "AGROTECH",
              style: GoogleFonts.ubuntu(fontSize: 50),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                      validator: (val) =>
                          val.contains("@") ? null : "Enter a valid email",
                      onSaved: (val) => _email = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (val) => val.length >= 6
                          ? null
                          : "Password must be 6 char long",
                      onSaved: (val) => _password = val,
                      onChanged: (val) => _password = val,
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (val) =>
                          val == _password ? null : "Passwords dont match",
                      obscureText: true,
                    ),
                    Container(
                      width: 250.0,
                      color: Colors.greenAccent,
                      child: FlatButton(
                        child: Text("SignUp"),
                        onPressed: _submit,
                      ),
                    ),
                    Container(
                      width: 250.0,
                      color: Colors.greenAccent,
                      child: FlatButton(
                        child: Text("LogIn"),
                        onPressed: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
