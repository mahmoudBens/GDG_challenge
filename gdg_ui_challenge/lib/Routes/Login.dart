import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';
import 'package:gdg_mahmoud_bensfia/DB/Authentification.dart';

import 'Navigation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _inscription = false;
  User user;

  final  formValidator=GlobalKey<FormState>();

  TextEditingController PasswordController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController NomController=TextEditingController();
  TextEditingController NumController=TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();



  String PasswordError;


  Alignment _alignment=Alignment.center;
  double _opacity=0;


  double _width=300;
  double _height=300;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    _timer =Timer(Duration(milliseconds: 4000),
          () {
        _timer.cancel();
        setState(() {
          _alignment = _alignment == Alignment.center ? Alignment.topCenter : Alignment.topCenter;
          _opacity=1;
          _width=150;
          _height=150;
          _timer.cancel();
        });

      },

    );
    return login();
  }


  Widget login() {


    PasswordController=TextEditingController();
    EmailController=TextEditingController();
    NomController=TextEditingController();
    NumController=TextEditingController();

    FirebaseAuth.instance;






    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 4000),
                    opacity:  _opacity,
                    curve: Curves.easeInOut,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: ColumnOther()),
                  ),
                  AnimatedAlign(
                      duration: Duration(seconds: 4),
                      alignment: _alignment,
                      curve: Curves.fastOutSlowIn,
                      child: AnimatedContainer(
                        width: _width,
                          height: _height,
                          duration: Duration(milliseconds: 4000),
                          child: ImageContainer())),
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }


  Column ColumnOther() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConnecterAvecContainer("Google",FontAwesomeIcons.google),
                  SizedBox(
                    height: 20,
                  ),
                  ConnecterAvecContainer("Téléphone",FontAwesomeIcons.phone),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formValidator,
                    child: Column(
                      children: [
                        Visibility(
                          visible: _inscription,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87),
                            ),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: NomController,
                              decoration: InputDecoration(
                                  hintText: "Nom & prénom",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.person_outline)),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _inscription,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87),
                            ),
                            child: TextFormField(
                              controller: NumController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: "Téléphone",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.smartphone)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black87),
                          ),
                          child: TextFormField(
                            focusNode: emailNode,
                            controller: EmailController,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (val){
                              emailNode.unfocus();
                              FocusScope.of(context).requestFocus(passwordNode);
                            },
                            validator: (val){
                              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
                              return !emailValid ? "Veuillez saisir un email valide":null;
                            },
                            decoration: InputDecoration(
                                hintText: "Email",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.alternate_email)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black87),
                          ),
                          child: TextFormField(
                            validator: (val){
                              return val.length<6 ? "Mot de passe doit contenir plus de 6 caracteres":null;
                            },
                            focusNode: passwordNode,
                            controller: PasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                errorText:  PasswordError ,
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.lock_outline)),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: ()  async {
                            if(formValidator.currentState.validate()) {
                             Authentification myAuth=Authentification(EmailController.text,PasswordController.text,_inscription);
                             myAuth.auth();
                             if(FirebaseAuth.instance.currentUser!=null){
                               Navigator.pushReplacement(
                                 context,
                                 MaterialPageRoute(builder: (context) => Navigation()),
                               );
                             }
                            }
                          },
                          splashColor: Colors.white,
                          hoverColor: Colors.blue,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(!_inscription ? "Se connecter" : "S'inscrire"),
                                Icon(Icons.arrow_right)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _inscription = !_inscription;
                      });
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: Text(
                            !_inscription
                                ? "Vous n'avez pas de compte ? S'inscrire"
                                : "Vous avez un compte ? Se connecter",
                            style: TextStyle(color: Colors.black54, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }

  Container ImageContainer() {
    return Container(
                height: _height,
                width: _width,
                child: Image(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.fill,
                ),
              );
  }

  Container ConnecterAvecContainer(String avec,IconData icon) {
    return Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black87),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,1),
                          color: Colors.grey,
                          blurRadius: 2
                      )
                    ]
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   Icon(icon,size: 20,color: Constants.grey3,),
                    SizedBox(width: 5,),
                    Text("Se connecter avec $avec")
                  ],
                ),
              );
  }
}
