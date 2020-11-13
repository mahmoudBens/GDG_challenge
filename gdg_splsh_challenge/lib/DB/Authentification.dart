import 'package:firebase_auth/firebase_auth.dart';

class Authentification {

   String _email,_password;
   bool _inscription;

   Authentification(this._email,this._password,this._inscription);

   Future<User> auth() async {
     FirebaseAuth.instance;
     UserCredential userCredential;
     if (_inscription) {
        try {
          userCredential = await FirebaseAuth
              .instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print(
                'The account already exists for that email.');
          }
        } catch (e) {
          print(e.toString());
        }
      }
      else {
        try {
           userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
            email: _email,
            password: _password,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }
     User user;
      try {
         user = userCredential.user;
      }catch(E){
        return user;
      }
    }
}