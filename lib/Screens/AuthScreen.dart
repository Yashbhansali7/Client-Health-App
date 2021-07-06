import 'package:flutter/services.dart';
import 'dart:io';
import '../Widgets/AuthForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/abc';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final auth = FirebaseAuth.instance;
  void submitAuthForm(String email, String pswd, String username, File image,
      bool isLogin, BuildContext ctx) async {
    UserCredential authResult;
    try {
      if (isLogin) {
        authResult =
            await auth.signInWithEmailAndPassword(email: email, password: pswd);
      } else {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: pswd);
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(authResult.user.uid + '.jpg');

        UploadTask uploadTask = ref.putFile(image);
        uploadTask.whenComplete(() async {
          final url = await ref.getDownloadURL();

          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user.uid)
              .set({
            'username': username,
            'email': email,
            'img_url': url,
            'userId': authResult.user.uid
          });
        });
      }
    } on PlatformException catch (e) {
      var message = 'An error occured. Please check your credentials';
      if (e.message != null) {
        message = e.message;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AuthForm(submitAuthForm));
  }
}
