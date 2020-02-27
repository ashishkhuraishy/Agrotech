import 'package:agrotech/Screens/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "AGROTECH",
              style: GoogleFonts.ubuntu(fontSize: 50),
            ),
            SizedBox(
              height: 24.0,
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
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (val) => val.length >= 6
                          ? null
                          : "Password must be 6 char long",
                      onSaved: (val) => _password = val,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: 250.0,
                      color: Colors.greenAccent,
                      child: FlatButton(
                        child: Text("LogIn"),
                        onPressed: _submit,
                      ),
                    ),
SizedBox(height: 24.0,),

                    Container(
                      width: 250.0,
                      color: Colors.greenAccent,
                      child: FlatButton(
                        child: Text("SignUp"),
                        onPressed: () {
                          Navigator.pushNamed(context, SignUp.id);
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
