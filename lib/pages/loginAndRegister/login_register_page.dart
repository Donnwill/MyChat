import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:my_chat/pages/loginAndRegister/login.dart';
import 'package:my_chat/pages/loginAndRegister/register.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool isRegisterPageActive = false;

  loginOrRegister(bool isRegister) {
    setState(() {
      isRegisterPageActive = isRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          // Colors.purple,
          Color(0xff006699), Color(0xff00ccff)
        ])),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: const FadeAnimation(
                  2,
                  Text(
                    "MyChat",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                  margin: const EdgeInsets.only(top: 60),
                  child: (!isRegisterPageActive) ? Login(loginOrRegister) : Register(loginOrRegister)),
            )
          ],
        ),
      ),
    );
  }
}
