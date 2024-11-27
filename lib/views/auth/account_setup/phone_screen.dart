import 'package:flutter/material.dart';
import 'package:swift_rides/services/api_sevices.dart';
import 'package:swift_rides/views/auth/widgets/auth_text_field.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class PhoneScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  PhoneScreen({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    super.key,
  });

  final TextEditingController _phoneController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    final apiService = ApiService();
    final response = await apiService.post(
      'register',
      {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'phone': _phoneController.text,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Failed!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Enter your phone number",
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
              labelText: "Phone Number",
              controller: _phoneController,
              hintText: "Enter your phone number",
              keyboardType: TextInputType.phone,
            ),
            const Spacer(),
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
    );
  }
}
