import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> signIn(String email, String password) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var signInValue = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    prefs.setString("Uid", signInValue.user.uid);
    return true;
  } on FirebaseAuthException catch (error) {
    if (error.code == "wrong-password") {
      print("Wrong Password");
      return false;
    }
    return false;
  } catch (error) {
    return false;
  }
}

Future<bool> signUp(String email, String password) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var signUpValue = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await prefs.setString("Uid", signUpValue.user.uid);

    return true;
  } on FirebaseAuthException catch (error) {
    if (error.code == "email-already-in-use") {
      print("already in use");
      return false;
    }
    return false;
  } catch (error) {
    return false;
  }
}
