import 'package:flutter/material.dart';
import 'package:swift_rides/views/profile/widgets/profile_detail.dart';
import 'package:swift_rides/views/profile/widgets/profile_pic.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const ProfilePic(image: "https://i.postimg.cc/cCsYDjvj/user-2.png"),
            Text(
              "Aurel Putri Widyanti",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            const ProfileDetail(
              title: "Username",
              value: "aurelputri",
            ),
            const ProfileDetail(
              title: "Email",
              value: "aurelwidyanti@gmail.com",
            ),
            const ProfileDetail(
              title: "Phone Number",
              value: "+62 812 3456 7890",
            ),
          ],
        ),
      ),
    );
  }
}
