import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/models/address_model.dart';
import 'package:swift_rides/providers/address_provider.dart';
import 'package:swift_rides/providers/booking_provider.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddressProvider>(context, listen: false)
          .fetchAddressesByUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
      final List<Address> addresses = addressProvider.addresses;

      if (addressProvider.isFetching) {
        return const Center(child: CircularProgressIndicator());
      }

      return addresses.isEmpty
          ? const Center(child: Text('No addresses found'))
          : Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: addresses.length,
                        itemBuilder: (context, index) {
                          final address = addresses[index];
                          return CustomAddressCard(
                            title: address.title!,
                            addressStreet: address.street!,
                            addressCity: address.city!,
                            isSelected: selectedAddress == address.title,
                            onSelect: () {
                              setState(() {
                                selectedAddress = address.title!;
                              });
                              Provider.of<BookingProvider>(context,
                                      listen: false)
                                  .addressId = address.id!;

                              Provider.of<BookingProvider>(context,
                                      listen: false)
                                  .address = address.title!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 360,
                      height: 44,
                      child: CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderScreen(),
                            ),
                          );
                        },
                        text: 'Confirm',
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
