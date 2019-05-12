// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// https://github.com/flutter/plugins/blob/master/packages/firebase_auth/example/lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './firebase_register_page.dart';
import './firebase_signin_page.dart';

class FirebaseAuthDemo extends StatefulWidget {
  const FirebaseAuthDemo({Key key}) : super(key: key);

  static const String routeName = '/firebase_auth';

  @override
  _FirebaseAuthDemoState createState() => _FirebaseAuthDemoState();
}

class _FirebaseAuthDemoState extends State<FirebaseAuthDemo> {
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: const Text('Test registration'),
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: RaisedButton(
              child: const Text('Test SignIn/SignOut'),
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
