import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';
import 'package:gdg_mahmoud_bensfia/DB/Authentification.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
           FirebaseAuth.instance.signOut();
          },
          child: Container(
            color: Constants.orange,
            width: 200,
            child: Text("SignOut",textAlign: TextAlign.center,),
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
