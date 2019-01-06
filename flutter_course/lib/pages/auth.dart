import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    "email": null,
    "password": null,
    "acceptTerms": false
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return ('Please enter a valid email');
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password is required and must contain 6+ characters';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  showAcceptTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Accept Terms'),
          content: Text('You must accept the terms.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Discard'),
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _submitForm(BuildContext context) {
    // If at least 1 field's validation fails,
    // return and not process the form
    if (!_formKey.currentState.validate()) {
      return;
    }

    if (!_formData['acceptTerms']) {
      showAcceptTermsDialog(context);
      return;
    }

    // Triggers onSave for Form Widgets that have this property
    _formKey.currentState.save();

    print(_formData);

    Navigator.pushReplacementNamed(context, 'products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth > 768.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    Container(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      // color: Theme.of(context).primaryColor,-- set by theme
                      textColor: Colors.white,
                      onPressed: () {
                        _submitForm(context);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
