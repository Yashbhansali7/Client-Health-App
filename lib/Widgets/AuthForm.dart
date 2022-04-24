import 'dart:io';

import 'package:fluttericon/entypo_icons.dart';

import '../Widgets/imgpicker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);
  final void Function(String email, String pswd, String username, File image,
      bool isLogin, BuildContext ctx) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPswd = '';
  File _img;
  void _pickedImg(File image) {
    _img = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (_img == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please Choose an Image',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPswd.trim(), _userName.trim(),
          _img, _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: _isLogin ? EdgeInsets.only(top: 160) : EdgeInsets.only(top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Entypo.feather,
              color: Colors.white,
              size: 30,
            ),
            const Text(
              ' Client Health',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ]),
          Card(
            margin: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!_isLogin) LoginImgpicker(_pickedImg),
                        TextFormField(
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email Address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              InputDecoration(labelText: 'Email Address'),
                          onSaved: (value) {
                            _userEmail = value;
                          },
                        ),
                        if (!_isLogin)
                          TextFormField(
                            key: ValueKey('username'),
                            validator: (value) {
                              if (value.isEmpty || value.length < 4) {
                                return 'Username Should be 4 Characters Long';
                              }
                              return null;
                            },
                            decoration: InputDecoration(labelText: 'Username'),
                            onSaved: (value) {
                              _userName = value;
                            },
                          ),
                        TextFormField(
                          key: ValueKey('pswd'),
                          validator: (value) {
                            if (value.isEmpty || value.length < 7) {
                              return 'Password Should be 7 Characters Long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          onSaved: (value) {
                            _userPswd = value;
                          },
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: _trySubmit,
                            child: Text(_isLogin ? 'Login' : 'SignUp')),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Create New Account'
                                : 'Back To Login')),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
