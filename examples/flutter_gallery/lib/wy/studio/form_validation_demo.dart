// Building a form with validation
// https://flutter.io/docs/cookbook/forms/validation
// https://iirokrankka.com/2017/10/17/validating-forms-in-flutter/

import 'package:flutter/material.dart';

class FormValidationDemo extends StatelessWidget {
  const FormValidationDemo({Key key}) : super(key: key);

  static const String routeName = '/form_validation';

  @override
  Widget build(BuildContext context) => LoginPage();
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  // not validate when the form field is first created
  bool _autoValidate = false;
  String _email;
  String _password;

  void _submit() {
    // unique identifiers that we can use to get a reference to our widgets.
    final form = formKey.currentState;

    // validate form before perform login
    if (form.validate()) {
      form.save();
      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    } else {
      setState(() {
        // Start validating on every change.
        _autoValidate = true;
      });
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Validating forms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: _autoValidate,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Your email'),
                // receives the current value of the field when FormFieldState#validate is called.
                // It should return either an error string or null.
                validator: (String val) => !val.contains('@') ? 'Not a valid email.' : null,
                // receives the current value of the field when FormFieldState#save is called.
                // This value should be saved somewhere, usually in an instance field of our state
                onSaved: (String val) => _email = val,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Your password'),
                validator: (String val) => val.length < 6 ? 'Password too short.' : null,
                onSaved: (String val) => _password = val,
                obscureText: true,
              ),
              const SizedBox(height: 8),
              RaisedButton(
                onPressed: _submit,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
