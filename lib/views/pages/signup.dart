import 'package:flutter/material.dart';
import '../../views/main.dart' show Logo, TextInputField, CustomButton;

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                        hintText: 'Display Name',
                        errorText: 'What should we call you?',
                      ),
                      const TextInputField(
                        hintText: 'Username',
                        errorText: 'Please enter your username',
                      ),
                      const SizedBox(height: 15),
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
                        text: 'Signup',
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
