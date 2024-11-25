// lib/views/pages/signup_page.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../index.dart' show Logo, TextInputField, CustomButton;
import '../../controllers/index.dart' show AuthService;

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // GlobalKey<FormState> is used for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Instance of AuthService to handle signup logic
  final AuthService _authService = AuthService();

  // Controllers to manage the input text for each TextInputField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // String variable to store error message (if any) during signup
  String? _errorMessage;

  /// Handles the signup process. It checks if the form is valid, and then
  /// calls the AuthService to perform the signup action.
  Future<void> _handleSignup() async {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // Retrieve the values from controllers
      final displayName = _nameController.text;
      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      // Call the signup method from AuthService
      String? errorMessage =
          await _authService.signup(displayName, username, email, password);

      // If an error message is returned from the signup process, display it
      if (errorMessage != null) {
        setState(() {
          _errorMessage = errorMessage;
        });
      } else {
        // Navigate to another screen or show a success message if signup is successful
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Text(
                  'Welcome!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        );
        // You could redirect to another route instead, based on your app's flow
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Logo(size: 100), // Display logo at the top
              Form(
                key: _formKey, // Reference the form to validate it
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    // Name input field
                    TextInputField(
                      controller: _nameController,
                      hintText: 'What should we call you?',
                      errorText: 'Please enter your name',
                    ),
                    const SizedBox(height: 15),
                    // Username input field
                    TextInputField(
                      controller: _usernameController,
                      hintText: 'Username',
                      errorText: 'Please enter your username',
                    ),
                    const SizedBox(height: 15),
                    // Email input field
                    TextInputField(
                      controller: _emailController,
                      hintText: 'Email',
                      errorText: 'Please enter a valid email',
                    ),
                    const SizedBox(height: 15),
                    // Password input field
                    TextInputField(
                      controller: _passwordController,
                      hintText: 'Password',
                      errorText: 'Please enter your password',
                      isPassword: true, // Make this a password field
                    ),
                    const SizedBox(height: 30),
                    // Custom button to trigger signup
                    CustomButton(
                      text: 'Signup', // Text on the button
                      onPressed:
                          _handleSignup, // Action to perform when button is pressed
                      formKey: _formKey, // Pass form key for validation
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            context.go('/login');
                          },
                          child: const Text('login',
                              style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 15,
                                  color: Colors
                                      .blue) // Add a text button to navigate to the signup page
                              ),
                        ),
                      ],
                    ),
                    // Display the error message if there is one
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
