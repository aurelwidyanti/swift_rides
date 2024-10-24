import 'package:flutter/material.dart';
import 'package:swift_rides/views/booking/widgets/address_bottom_sheet.dart';
import 'package:swift_rides/widgets/custom_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateRangePickerController _datePickerController = DateRangePickerController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SfDateRangePicker(
            headerStyle: const DateRangePickerHeaderStyle(
              backgroundColor: Colors.white,
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            todayHighlightColor: const Color.fromRGBO(23, 93, 227, 1),
            selectionColor: const Color.fromRGBO(23, 93, 227, 1),
            startRangeSelectionColor: const Color.fromRGBO(23, 93, 227, 1),
            endRangeSelectionColor: const Color.fromRGBO(23, 93, 227, 1),
            rangeSelectionColor: const Color.fromRGBO(23, 93, 227, 0.2),
            backgroundColor: Colors.white,
            controller: _datePickerController,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                if (args.value is PickerDateRange) {
                  startDate = args.value.startDate;
                  endDate = args.value.endDate ?? args.value.startDate;
                }
              });
            },
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                if (startDate != null && endDate != null) {
                  Navigator.pop(context);

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (context) => const AddressBottomSheet(),
                  );
                }
              },
              text: "Next",
            ),
          ),
        ],
      ),
    );
  }
}
