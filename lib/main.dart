import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_validator/email_validator.dart';



void main(){
  runApp(Cocktail());
}
class Cocktail extends StatelessWidget {
//  final FirebaseAuth _auth=FirebaseAuth.instance;
//  final GoogleSignIn _googleSignIn =  GoogleSignIn();
//
//  Future<FirebaseUser> _signIn() async{
//    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//    _auth.signInWithEmailAndPassword(email: "abc", password: "1234");
//  }

  @override
  Widget build(BuildContext context) {
    final home = "/a";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.blueGrey

      ),

      home: LoginPage(),
//      routes: <String, WidgetBuilder>{
//        "/a": (BuildContext context) => Checking("DawerClick")
//      },
    );
  }
}

class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState()=> _LoginPageState();

}
class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation _iconAnimation;


  @override
  void initState() {
  super.initState();
  _iconAnimationController = new AnimationController(
  vsync: this, duration: new Duration(milliseconds: 1000));
  _iconAnimation = CurvedAnimation(
  parent: _iconAnimationController,
  curve: Curves.bounceOut,
  );
  _iconAnimation.addListener(() => this.setState(() {}));
  _iconAnimationController.forward();
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          fit: StackFit.expand, children: <Widget>[

        Image(
          image: AssetImage("assets/loginback.jpeg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        Theme(
          data: ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 140.0,
              ),
              Container(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       TextField(
                         controller: emailController,
                        decoration: InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),

                       TextField(
                         controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(FontAwesomeIcons.signInAlt),
                        onPressed: () async {
                          if (!EmailValidator.validate(emailController.text)) {

                          } else {
                            FirebaseUser user = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)).user;
                            if (user == null) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Container(
                                  child: Text("Unable to Sign Up"),
                                ),
                              ));
                            } else {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(duration: Duration(seconds: 3),
                                    content: Text("You Click Login Button"),
                                  ));
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            }
                          }

                        }
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}









//import 'home.dart';
//void main(){
//  runApp(new CocktailApp());
//}
//const Color mycolor= Colors.teal;
//class CocktailApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//
//      debugShowCheckedModeBanner: false,
//    title: "CocktailApp",
//    theme: ThemeData(
//     primarySwatch: mycolor,
//     brightness: Brightness.light,
//     accentColor: Colors.black26
//    ),
//    home: HomePage(),
//
//    );
//  }
//}
