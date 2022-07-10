import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authComplete = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Start or Join a Meeting",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              emptySpace(context),
              Image.asset("assets/images/onboarding.jpeg"),
              emptySpace(context),
              CustomButton(
                buttonName: "Login",
                onPressed: () async {
                  bool res = await _authComplete.signInWithGoogle(context);
                  if (res) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
              )
            ],
          ),
        ));
  }

  Widget emptySpace(BuildContext context) {
    return Container(height: 50);
  }
}
