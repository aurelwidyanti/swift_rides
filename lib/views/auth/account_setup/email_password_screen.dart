import 'package:flutter/material.dart';
import 'package:swift_rides/views/auth/account_setup/phone_screen.dart';
import 'package:swift_rides/views/auth/widgets/auth_text_field.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class EmailPasswordScreen extends StatelessWidget {
  final String firstName;
  final String lastName;

  EmailPasswordScreen(
      {required this.firstName, required this.lastName, super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Enter your email & password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTextField(
              labelText: "Email",
              controller: _emailController,
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              labelText: "Password",
              controller: _passwordController,
              hintText: "Enter your password",
              obscureText: true,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhoneScreen(
                        firstName: firstName,
                        lastName: lastName,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
