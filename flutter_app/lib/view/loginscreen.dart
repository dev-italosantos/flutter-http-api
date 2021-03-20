import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/login_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (res) {
              email = res;
            },
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            onChanged: (res) {
              password = res;
            },
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
              child: Text('Authenticate'),
              onPressed: () {
                LoginRepository();
              })
        ],
      ),
    );
  }
}
