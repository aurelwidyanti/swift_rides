import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swift_rides/helpers/sp_helper.dart';
import 'package:swift_rides/services/api_sevices.dart';
import 'package:swift_rides/utils/entrypoint.dart';
import 'package:swift_rides/views/auth/login_screen.dart';
import 'package:swift_rides/views/auth/widgets/auth_text_field.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _obscureText = true;
  bool _isFetching = false;

  Future<void> _register(BuildContext context) async {
    setState(() {
      _isFetching = true;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final email = _emailController.text;
      final password = _passwordController.text;
      final username = _usernameController.text;

      final apiService = ApiService();
      final response = await apiService.post(
        'register',
        {'email': email, 'password': password, 'username': username},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['access_token'];
        await SharedPreferencesHelper.setAccessToken(token);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Entrypoint(),
          ),
          (_) => true,
        );
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration failed"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("An error occurred"),
          ),
        );
      }
    }

    setState(() {
      _isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                          color: const Color.fromRGBO(23, 93, 227, 1),
                        ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/icon/icon2.png',
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      labelText: "Email",
                      controller: _emailController,
                      hintText: "example@mail.com",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? "Email address is required" : null,
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      labelText: "Username",
                      controller: _passwordController,
                      hintText: "username",
                      obscureText: _obscureText,
                      validator: (value) =>
                          value!.isEmpty ? "Password is required" : null,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      labelText: "Create Password",
                      controller: _passwordController,
                      hintText: "must be 8 password",
                      obscureText: _obscureText,
                      validator: (value) =>
                          value!.isEmpty ? "Password is required" : null,
                      onSuffixIconTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      labelText: "Confirm Password",
                      controller: _passwordController,
                      hintText: "repeat password",
                      obscureText: _obscureText,
                      validator: (value) =>
                          value!.isEmpty ? "Password is required" : null,
                      onSuffixIconTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: CustomButton(
                        text: 'Register',
                        onPressed: () => _register(context),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                          fontSize: 15),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
