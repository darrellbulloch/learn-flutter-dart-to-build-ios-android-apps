import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  String emailAddressValue;
  String passwordValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              emailAddressValue = value;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
            ),
          ),
          TextField(
            onChanged: (String value) {
              passwordValue = value;
            },
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {
              print('Email Address = ${emailAddressValue}');
              print('Password = ${passwordValue}');
              Navigator.pushReplacementNamed(context, 'products');
            },
            child: Text('Login'),
          ),
        ],
      )),
    );
  }
}
