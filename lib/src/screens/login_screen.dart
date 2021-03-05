// Created by ferdyhaspin on 06/03/21.

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String _email, _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'ferdihaspin@gmail.com',
        ),
        validator: (String value) {
          if (!value.contains('@')) {
            return 'Please enter a valid email';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          _email = value;
        },
      ),
    );
  }

  Widget passwordField() {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'password',
        ),
        validator: (String value) {
          if (value.length < 4) {
            return 'Password must be at least 4 characters';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          _password = value;
        },
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();

          print('Time to post $_email & $_password to API!');
        }
      },
      child: Text('Submit!'),
    );
  }
}
