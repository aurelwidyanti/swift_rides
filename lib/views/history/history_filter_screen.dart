import 'package:flutter/material.dart';
import 'package:swift_rides/utils/constants.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class HistoryFilterScreen extends StatefulWidget {
  const HistoryFilterScreen({super.key});

  @override
  State<HistoryFilterScreen> createState() => _HistoryFilterScreenState();
}

class _HistoryFilterScreenState extends State<HistoryFilterScreen> {
  String selectedTime = 'Semua';
  String selectedStatus = 'Semua';

  Widget buildOptionButton(
      String option, String selectedOption, Function(String) onSelect) {
    final isSelected = option == selectedOption;
    return OutlinedButton(
      onPressed: () => onSelect(option),
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color.fromRGBO(23, 93, 227, 1) : Colors.white,
        side: BorderSide(
            color: isSelected
                ? const Color.fromRGBO(23, 93, 227, 1)
                : Colors.black45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        option,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
          title: "Filter",
          showBackButton: true,
          backgroundColor: Color.fromRGBO(23, 93, 227, 1),
          textColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Waktu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(23, 93, 227, 1),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: timeFilter
                  .map((option) =>
                      buildOptionButton(option, selectedTime, (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      }))
                  .toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(23, 93, 227, 1),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: statusFilter
                  .map((option) =>
                      buildOptionButton(option, selectedStatus, (value) {
                        setState(() {
                          selectedStatus = value;
                        });
                      }))
                  .toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: CustomButton(
                onPressed: () {},
                text: 'Apply Filter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
