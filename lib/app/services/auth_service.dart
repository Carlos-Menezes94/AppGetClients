import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? userInital) {
      user = (userInital == null) ? null : userInital;
      isLoading = false;
      notifyListeners();
    });
  }


  _getUser(){
    user = _auth.currentUser;
    notifyListeners();
  }

  register(String password, String email) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

          _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "week-password") {
        throw AuthException("A senha é muito fraca");
        
      }else if(e.code == "email-already-in-use"){
        throw AuthException("E-mail já esta cadastrado");

      }
       else if(e.code == "invalid-email"){
        throw AuthException(e.message!);

      }
    }
  }


  login(String password, String email) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);

          _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("E-mail não encontrado");
        
      }else if(e.code == "wrong-password"){
        throw AuthException("Senha incorretao");

      }
    }
  }

  logout() async{
    await _auth.signOut();
    _getUser();

  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
