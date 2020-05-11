import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelsafe/screens/home.dart';
import 'package:travelsafe/screens/login.dart';

class AuthService{
  // handleAuth(){
  //   return StreamBuilder(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (BuildContext context, snapshot){
  //       if(snapshot.hasData){
  //         return Home();
  //       }
  //       else{
  //         return LoginPage();
  //       }
  //     }
  //   );
  // }

  FirebaseUser user;

  signOut(){
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds){
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId){
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
      verificationId: verId, 
      smsCode: smsCode,
    );
    signIn(authCreds);
  }
}