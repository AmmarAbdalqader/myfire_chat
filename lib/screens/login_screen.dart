import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfire_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:myfire_chat/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                    value = '';
                  },
                  decoration:
                      kInputFieldDecoration('Email', Colors.lightBlueAccent)),
              SizedBox(
                height: 8,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kInputFieldDecoration(
                      'Password', Colors.lightBlueAccent)),
              SizedBox(
                height: 24,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    UserCredential login =
                        await _auth.signInWithEmailAndPassword(
                            email: email!, password: password!);
                    if (login != null) {
                      Navigator.pushReplacementNamed(context, '/chat');
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
