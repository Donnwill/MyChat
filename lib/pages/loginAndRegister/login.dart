import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/helper/authentication.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  final Function loginOrRegister;
  Login(this.loginOrRegister);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  bool isRegister = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    "SignIn",
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
                            onChanged: (emailId) {
                              email = emailId;
                            },
                            validator: (emailId) {
                              if (EmailValidator.validate(emailId)) {
                                return null;
                              }
                              return " Enter a valid email";
                            },
                            keyboardType: TextInputType.emailAddress,
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
                      Icon(Icons.vpn_key_outlined),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              labelText: " Password ...",
                              border: InputBorder.none,
                            ),
                            onChanged: (passwordValue) {
                              password = passwordValue;
                            },
                            validator: (passwordValue) {
                              if (passwordValue != "") {
                                return null;
                              }
                              return " Enter a valid password";
                            },
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
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    bool shouldNavigate = await signIn(email, password);
                    FirebaseAnalytics().logLogin();
                    if (shouldNavigate) {
                      print("Success");
                    } else {
                      print("Failed");
                    }
                    
                  } 
                },
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
                      'SignIn',
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
                    Text('''Don't have an account? ''', style: TextStyle(fontSize: 16, color: Colors.black87)),
                    TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateColor.resolveWith((states) => Color(0xff006699)),
                      ),
                      onPressed: () {
                        print('Sign Up');
                        widget.loginOrRegister(isRegister);
                      },
                      child: Text('SignUp'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
