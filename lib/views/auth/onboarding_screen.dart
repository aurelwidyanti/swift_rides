import 'package:flutter/material.dart';
import 'package:swift_rides/views/auth/account_setup/name_screen.dart';
import 'package:swift_rides/views/auth/login_screen.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to\nSwift Rides",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Activate your account to start using!\n"
                    "Please provide your profile details step by step\n"
                    "to complete your registration.\n"
                    "Once all the required information is submitted, you’ll be all set to begin.\n\n"
                    "If you already have an account, simply click on the 'Login' button to access your account and start using Swift Rides.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black38,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 3),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: CustomButton(
                    text: 'Register',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NameScreen(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: CustomButton(
                    text: 'Login',
                    backgroundColor: const Color.fromARGB(255, 237, 237, 237),
                    textColor: Colors.black,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
