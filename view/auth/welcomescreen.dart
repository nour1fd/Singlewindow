import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled1/view/auth/loginscreen.dart';
import 'package:untitled1/view/auth/registerscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/imgs/welcome.jpg",
              ),
              SizedBox(height: 30.0),
              Center(
                child: Text(
                  "النافذة الواحدة",
                  style: TextStyle(
                    fontFamily: "Amiri-Bold",
                    color: Colors.orangeAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right:200),
                child: MaterialButton(
                  height: 50.0,
                  minWidth: 210.0,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),) );
                  },
                  child: Text(
                    "ابدأ",
                    style: TextStyle(fontSize: 19.0),
                  ),
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "ليس لديك حساب؟",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 23.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                        },
                        child: Text(
                          "إنشاء حساب ",
                          style: TextStyle(color: Colors.black87),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
