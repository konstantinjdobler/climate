import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          children: <Widget>[
            Text('hallo'),
            FlatButton(
              color: Colors.white,
              child: Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, 'View');
              },
            )
          ],
        ),
      ),
    );
  }
}
