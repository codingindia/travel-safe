import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signUp(
      String email, String password, String name, String phone);
}

class Auth extends BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final String fireStoreCollection = "users";

  Future<String> signUp(
      String email, String password, String name, String phone) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      try {
        await _firestore
            .collection(fireStoreCollection)
            .document(result.user.uid)
            .setData({
          "uid": result.user.uid,
          "name": name,
          "phone": phone,
          "email": email
        });

        return result.user.uid;
      } catch (e) {
        print(e.message);
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }
}
