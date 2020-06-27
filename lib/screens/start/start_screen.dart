import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  Widget _submitButton() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
           Navigator.pushNamed(context, '/register');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            'Register now',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:SingleChildScrollView(
        child:Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00d4ff), Color(0xff14c5d6)]
                  )
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/login/google-logo.png',),
                SizedBox(
                  height: 80,
                ),
                _submitButton(),
                SizedBox(
                  height: 20,
                ),
                _signUpButton(),
                SizedBox(
                  height: 20,
                ),
                _label()
              ],
            ),
          ),
      ),
    );
  }
}