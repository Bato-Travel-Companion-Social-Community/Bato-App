// lib/views/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../index.dart' show Logo, TextInputField, CustomButton;
import '../../../controllers/index.dart' show AuthService;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GlobalKey<FormState> is used to manage and validate the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Instance of AuthService to handle login logic
  final AuthService _authService = AuthService();

  // TextEditingControllers to retrieve user input for the login form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable to store the error message (if any) during login
  String? _errorMessage;

  /// Handles the login action by validating the form and calling the
  /// AuthService to perform the login.
  Future<void> _handleLogin() async {
    // Validate the form before proceeding with login
    if (_formKey.currentState!.validate()) {
      // Retrieve email and password from the controllers
      final email = _emailController.text;
      final password = _passwordController.text;

      // Call the login method from AuthService
      String? errorMessage = await _authService.login(email, password);

      // If there's an error message returned from the login process, display it
      if (errorMessage != null) {
        setState(() {
          _errorMessage = errorMessage;
        });
      } else {
        // Navigate to another screen after a successful login
        context.go('/my_community');
        // You can replace this with navigation to a home or dashboard screen
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Logo(size: 100), // Display logo at the top of the screen
            Center(
              child: Form(
                key: _formKey, // Reference the form to enable validation
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    // Email input field
                    TextInputField(
                      controller: _emailController,
                      hintText: 'Email',
                      errorText:
                          'Please enter your email', // Validation error message
                    ),
                    const SizedBox(height: 15),
                    // Password input field
                    TextInputField(
                      controller: _passwordController,
                      hintText: 'Password',
                      errorText:
                          'Please enter your password', // Validation error message
                      isPassword: true, // Treat this field as a password field
                    ),
                    const SizedBox(height: 30),
                    // Custom button for triggering the login process
                    CustomButton(
                      text: 'Login', // Text to display on the button
                      onPressed: _handleLogin, // Action to trigger login
                      formKey:
                          _formKey, // Pass formKey to ensure form validation
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            context.go('/signup');
                          },
                          child: const Text('Signup',
                              style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 15,
                                  color: Colors
                                      .blue) // Add a text button to navigate to the signup page
                              ),
                        ),
                      ],
                    ),
                    // Display error message (if any)
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          _errorMessage!, // Display error message
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
