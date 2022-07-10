import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/widgets/snackBar.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();

  signInWithGoogle(context) async {
    bool res = false;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      // return await FirebaseAuth.instance.signInWithCredential(credential);

      UserCredential userCredentials =
          await _auth.signInWithCredential(credential);

      User? user = userCredentials.user;

      if (user != null) {
        if (userCredentials.additionalUserInfo!.isNewUser) {
          await _fireStore.collection("users").doc(user.uid).set({
            "userName": user.displayName,
            "uid": user.uid,
            "profilePhoto": user.photoURL,
            "phoneNumner": user.phoneNumber
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (error) {
      showSnackBar(context, error.message.toString());
      res = false;
    }
    return res;
  }
}
