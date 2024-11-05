import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/helpers/sp_helper.dart';
import 'package:swift_rides/providers/user_provider.dart';
import 'package:swift_rides/services/api_sevices.dart';
import 'package:swift_rides/views/auth/login_screen.dart';
import 'package:swift_rides/views/profile/widgets/profile_detail.dart';
import 'package:swift_rides/views/profile/widgets/profile_pic.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService apiService = ApiService();

  Future<void> _logout() async {
    final response = await apiService.post('logout', {});
    print(response.statusCode);
    if (response.statusCode == 200) {
      await SharedPreferencesHelper.clearAccessToken();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (_) => true,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.isFetching) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Profile",
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.name ?? "Unknown",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            ProfileDetail(
              title: "Username",
              value: user?.username ?? "Unknown",
            ),
            ProfileDetail(
              title: "Email",
              value: user?.email ?? "Unknown",
            ),
            ProfileDetail(
              title: "Phone Number",
              value: user?.phone ?? "Unknown",
            ),
            ProfileDetail(
              title: "Role",
              value: user?.role ?? "Unknown",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Logout',
                onPressed: _logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
