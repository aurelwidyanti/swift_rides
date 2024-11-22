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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: CustomTextField(
          hintText: 'Search for a ride',
          controller: TextEditingController(),
          prefixIcon: HugeIcons.strokeRoundedSearch01,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
      ),
    );
  }
}
