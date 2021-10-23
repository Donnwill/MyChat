import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_chat/helper/authentication.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:my_chat/models/users.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Register extends StatefulWidget {
  final Function loginOrRegister;
  Register(this.loginOrRegister);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  bool isRegister = false;

  CollectionReference users;
  Users usersData = Users();
  final dateFormat = DateFormat("yyyy-MM-dd");

  PhoneNumber number = PhoneNumber(isoCode: 'DE');

  addUsers(Users usersData) async {
    users.add({
      "userName": usersData.userName,
      "emailID": usersData.email,
      "phoneNumber": usersData.phoneNumber,
      "dateOfBirth": usersData.dateOfBirth
    });
  }

  @override
  void initState() {
    super.initState();
    users = FirebaseFirestore.instance.collection('users');
  }

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
                    "SignUp",
                    style: TextStyle(fontSize: 35, color: Colors.black87, letterSpacing: 2),
                  ),
                )),
            FadeAnimation(
              2,
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      const Icon(Icons.person_outline),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              labelText: " User Name",
                              border: InputBorder.none,
                            ),
                            onChanged: (userName) {
                              usersData.userName = userName;
                            },
                            validator: (userName) {
                              if (userName != "") {
                                return null;
                              }
                              return " Enter a valid user name";
                            },
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
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              usersData.email = emailId;
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
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: InternationalPhoneNumberInput(
                            inputBorder: InputBorder.none,
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            onInputValidated: (bool isPhoneNumberValid) {
                              if (isPhoneNumberValid) {
                                return null;
                              }
                            },
                            onInputChanged: (PhoneNumber number) {
                              usersData.phoneNumber = number.phoneNumber;
                            },
                            selectorButtonOnErrorPadding: 0,
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            initialValue: number,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
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
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      const Icon(Icons.date_range_outlined),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: DateTimeField(
                            format: dateFormat,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                            decoration: const InputDecoration(
                              labelText: " Date Of Birth",
                              border: InputBorder.none,
                            ),
                            onChanged: (birthDate) {
                              usersData.dateOfBirth = DateFormat("dd-MM-yyyy").format(birthDate).toString();
                            },
                            validator: (birthDate) {
                              if (birthDate != null) {
                                return null;
                              }
                              return " Enter a valid date of birth";
                            },
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
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    bool shouldNavigate = await signUp(email, password);
                    FirebaseAnalytics().logSignUp(signUpMethod: "createUserWithEmailAndPassword");
                    if (shouldNavigate) {
                      await addUsers(usersData);
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
                      'SignUp',
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
                    Text('''Already have an account? ''', style: TextStyle(fontSize: 16, color: Colors.black87)),
                    TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateColor.resolveWith((states) => Color(0xff006699)),
                      ),
                      onPressed: () {
                        widget.loginOrRegister(isRegister);
                      },
                      child: Text('SignIn'),
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
