import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              // color: Colors.red,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 22, bottom: 20),
                              child: const FadeAnimation(
                                2,
                                Text(
                                  "Login",
                                  style: TextStyle(fontSize: 35, color: Colors.black87, letterSpacing: 2),
                                ),
                              )),
                          FadeAnimation(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff006699), width: 1),
                                    boxShadow: const [
                                      BoxShadow(color: Color(0xff006699), blurRadius: 10, offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.email_outlined),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            labelText: " E-mail ...",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          FadeAnimation(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff006699), width: 1),
                                    boxShadow: const [
                                      BoxShadow(color: Color(0xff006699), blurRadius: 10, offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.paste),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            labelText: " Password ...",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            2,
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Color(0xff006699),
                                  shadowColor: Color(0xff006699),
                                  elevation: 18,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [Color(0xff006699), Color(0xff00ccff)]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: FadeAnimation(
                              2,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('''Don't have an account? ''',
                                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                                  TextButton(
                                    style: ButtonStyle(
                                      shadowColor: MaterialStateColor.resolveWith((states) => Color(0xff006699)),
                                    ),
                                    onPressed: () {
                                      print('Sign Up');
                                    },
                                    child: Text('Register Now'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
