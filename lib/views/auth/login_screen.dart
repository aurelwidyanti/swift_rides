import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swift_rides/helpers/sp_helper.dart';
import 'package:swift_rides/services/api_sevices.dart';
import 'package:swift_rides/utils/entrypoint.dart';
import 'package:swift_rides/views/auth/register_screen.dart';
import 'package:swift_rides/views/auth/widgets/auth_text_field.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_scrollToFocusedField);
    _passwordFocusNode.addListener(_scrollToFocusedField);
  }

  void _scrollToFocusedField() {
    if (_scrollController.hasClients) {
      if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _login(BuildContext context) async {
    setState(() {
      _isFetching = true;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final email = _emailController.text;
      final password = _passwordController.text;

      final apiService = ApiService();
      final response = await apiService.post(
        'login',
        {'email': email, 'password': password},
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
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid email or password"),
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
                    "Log in",
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
                      focusNode: _emailFocusNode,
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      labelText: "Password",
                      controller: _passwordController,
                      hintText: "must be 8 password",
                      obscureText: _obscureText,
                      validator: (value) =>
                          value!.isEmpty ? "Password is required" : null,
                      focusNode: FocusNode(),
                      onSuffixIconTap: () {
                        setState(
                          () {
                            _obscureText = !_obscureText;
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: CustomButton(
                        text: 'Login',
                        onPressed: () => _login(context),
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
                      "Don’t have account?",
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
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                      child: const Text(
                        "Register",
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
