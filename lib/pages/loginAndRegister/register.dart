import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_chat/helper/authentication.dart';
import 'package:my_chat/helper/custom_container.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:my_chat/models/users.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool isRegisterPageActive = false;

  CollectionReference registerUser;
  Users usersData = Users();
  final dateFormat = DateFormat("dd-MM-yyyy");

  PhoneNumber number = PhoneNumber(isoCode: 'DE');

  addUsers(Users usersData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("Uid");

    registerUser.doc(uid).set({
      "userName": usersData.userName,
      "emailID": usersData.email,
      "phoneNumber": usersData.phoneNumber,
      "dateOfBirth": usersData.dateOfBirth
    });
  }

  registrationSuccessPopUp(String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FadeAnimation(
            1.5,
            AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: FadeAnimation(1.5, Text(title)),
              content: FadeAnimation(2, Text(content)),
              buttonPadding: EdgeInsets.only(right: 25.0),
              elevation: 18,
              actions: [
                FadeAnimation(
                  2.5,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Color(0xff006699),
                          shadowColor: Color(0xff006699),
                          elevation: 18,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.of(context).pop();
                        widget.loginOrRegister(isRegisterPageActive);
                      },
                      child: Ink(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xff006699), Color(0xff00ccff)]),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Ok",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    registerUser = FirebaseFirestore.instance.collection('users');
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
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 22, bottom: 20),
                child: const FadeAnimation(
                  2,
                  Text(
                    "SignUp",
                    style: TextStyle(fontSize: 35, color: Colors.black87, letterSpacing: 2),
                  ),
                )),
            CustomContainer(
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
                  ),
            ),
            CustomContainer(
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
                  ),
            ),
            CustomContainer(
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
                  ),
            ),
            CustomContainer(
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
                  ),
            ),
            CustomContainer(
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
                  ),
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
                      registrationSuccessPopUp(
                          "Successful", "You have successfully registered. Kindly login to continue.");
                    } 
                  } else {
                    //error handling here
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
                        widget.loginOrRegister(isRegisterPageActive);
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
