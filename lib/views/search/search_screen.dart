import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_rides/views/search/widgets/search_filter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: Colors.black,
                  size: 22,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
