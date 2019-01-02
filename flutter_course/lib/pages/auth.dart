import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SwitchListTile(
              value: _acceptTerms,
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              },
              title: Text('Accept Terms'),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                print('Email = $_emailValue');
                print('Password = $_passwordValue');
                Navigator.pushReplacementNamed(context, 'products');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
