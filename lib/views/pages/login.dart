import 'package:flutter/material.dart';
import '../../views/main.dart' show Logo, TextInputField, CustomButton;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Logo(size: 100),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      const TextInputField(
                        hintText: 'Email',
                        errorText: 'Please enter your email',
                      ),
                      const SizedBox(height: 15),
                      const TextInputField(
                        hintText: 'Password',
                        errorText: 'Please enter your password',
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'Login',
                        formKey: _formKey,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
