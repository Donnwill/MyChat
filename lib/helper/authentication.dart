import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

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
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
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
