import 'package:flutter/material.dart';
import '../../views/main.dart' show Logo, TextInputField, CustomButton;
import '../../controllers/main.dart' show AuthService;

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  // TextEditingControllers to retrieve text from TextInputFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage; // For displaying error messages

  // Handle signup action
  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      final displayName = _nameController.text;
      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      // Call signup from AuthService
      String? errorMessage =
          await _authService.signup(displayName, username, email, password);

      if (errorMessage != null) {
        setState(() {
          _errorMessage = errorMessage;
        });
      } else {
        // Navigate to another screen or show success message if signup is successful
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
// Or another route as per your app's flow
      }
    }
  }

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
                    TextInputField(
                      controller: _nameController,
                      hintText: 'What should we call you?',
                      errorText: 'Please enter your name',
                    ),
                    const SizedBox(height: 15),
                    TextInputField(
                      controller: _usernameController,
                      hintText: 'Username',
                      errorText: 'Please enter your username',
                    ),
                    const SizedBox(height: 15),
                    TextInputField(
                      controller: _emailController,
                      hintText: 'Email',
                      errorText: 'Please enter a valid email',
                    ),
                    const SizedBox(height: 15),
                    TextInputField(
                      controller: _passwordController,
                      hintText: 'Password',
                      errorText: 'Please enter your password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Signup',
                      onPressed: _handleSignup,
                      formKey: _formKey,
                    ),
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
