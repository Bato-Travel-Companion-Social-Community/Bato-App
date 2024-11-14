import 'package:flutter/material.dart';
import '../../views/main.dart' show Logo, TextInputField, CustomButton;
import '../../controllers/main.dart' show AuthService;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  // TextEditingControllers to retrieve text from TextInputFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage; // For displaying error messages

  // Handle login action
  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Call login from AuthService
      String? errorMessage = await _authService.login(email, password);

      if (errorMessage != null) {
        setState(() {
          _errorMessage = errorMessage;
        });
      } else {
        // Navigate to another screen if login is successful
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
        ); // Or any other route after login
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
                      controller: _emailController,
                      hintText: 'Email',
                      errorText: 'Please enter your email',
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
                      text: 'Login',
                      onPressed: _handleLogin,
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
