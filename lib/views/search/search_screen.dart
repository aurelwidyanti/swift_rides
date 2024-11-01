import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_rides/views/search/widgets/search_filter.dart';
import 'package:swift_rides/widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 72, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'Where to?',
              controller: TextEditingController(),
              prefixIcon: HugeIcons.strokeRoundedSearch01,
            ),
            const SizedBox(height: 24),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            const Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SearchFilter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
