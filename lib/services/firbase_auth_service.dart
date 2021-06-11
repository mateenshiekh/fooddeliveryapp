import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  final String uid;
  final String displayName;
  final String email;
  User({this.email, this.displayName, this.uid});
}

class AuthService extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  User userInformation;

  Future<User> signUp(String email, String password, String fullname) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser currentUser = user.user;

    var usrInfo = UserUpdateInfo();
    usrInfo.displayName = fullname;
    await currentUser.updateProfile(usrInfo);
    await currentUser.reload();
    return User(
        email: currentUser.email,
        uid: currentUser.uid,
        displayName: currentUser.displayName);
  }

  Future<User> signIn(String email, String password) async {
    var res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = res.user;

    if (user == null) throw Exception("Incorrect Email or Password");

    userInformation = User(
        email: res.user.email,
        uid: res.user.uid,
        displayName: res.user.displayName);

    return userInformation;
  }

  Future signOut() async {
    userInformation = null;
    return await _auth.signOut();
  }
}
