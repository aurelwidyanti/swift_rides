import 'package:flutter/material.dart';
import 'package:swift_rides/views/order/order_screen.dart';
import 'package:swift_rides/views/order/widgets/calendar_bottom_sheet.dart';
import 'package:swift_rides/widgets/custom_address_card.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({super.key});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  String selectedAddress = 'Home';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const CalendarBottomSheet(),
                  );
                },
              ),
              const Text(
                'Please select your address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            runSpacing: 12,
            children: [
              CustomAddressCard(
                title: 'Home',
                addressStreet: '1234 Swift Street',
                addressCity: 'Swift City',
                isSelected: selectedAddress == 'Home',
                onSelect: () {
                  setState(() {
                    selectedAddress = 'Home';
                  });
                },
              ),
              CustomAddressCard(
                title: 'Work',
                addressStreet: '5678 Swift Street',
                addressCity: 'Swift City',
                isSelected: selectedAddress == 'Work',
                onSelect: () {
                  setState(() {
                    selectedAddress = 'Work';
                  });
                },
              ),
              CustomAddressCard(
                title: 'Other',
                addressStreet: '9101 Swift Street',
                addressCity: 'Swift City',
                isSelected: selectedAddress == 'Other',
                onSelect: () {
                  setState(() {
                    selectedAddress = 'Other';
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingScreen(),
                  ),
                );
              },
              text: 'Confirm',
            ),
          ),
        ],
      ),
    );
  }
}
