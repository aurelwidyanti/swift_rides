import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:swift_rides/models/booking_model.dart';
import 'package:swift_rides/services/api_sevices.dart';
import 'package:swift_rides/views/order/success_order_screen.dart';

class BookingProvider with ChangeNotifier {
  ApiService apiService = ApiService();
  List<Booking> _bookings = [];
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 1));
  int _addressId = 0;
  String _address = '';
  int _carId = 0;
  String _car = '';
  double _price = 0.0;

  List<Booking> get bookings => _bookings;

  DateTime get startDate => _startDate;

  set startDate(DateTime startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  DateTime get endDate => _endDate;

  set endDate(DateTime endDate) {
    _endDate = endDate;
    notifyListeners();
  }

  int get addressId => _addressId;

  set addressId(int addressId) {
    _addressId = addressId;
    notifyListeners();
  }

  String get address => _address;

  set address(String address) {
    _address = address;
    notifyListeners();
  }

  int get carId => _carId;

  set carId(int carId) {
    _carId = carId;
    notifyListeners();
  }

  String get car => _car;

  set car(String car) {
    _car = car;
    notifyListeners();
  }

  double get price => _price;

  set price(double price) {
    _price = price;
    notifyListeners();
  }

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  double calculateTotalPrice() {
    try {
      final int days = _endDate.difference(_startDate).inDays;
      return _price * days;
    } catch (e) {
      print('Failed to calculate total price: $e');
      return 0.0;
    }
  }

  Future<void> fetchBookings() async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.get('bookings/showByUser');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _bookings = data.map((item) => Booking.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Failed to fetch bookings: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> addBooking(BuildContext context) async {
    _isFetching = true;
    notifyListeners();
    try {
      Booking booking = Booking(
        startDate: _startDate,
        endDate: _endDate,
        addressId: _addressId,
        carId: _carId,
        status: 'confirmed',
      );
      final response = await apiService.post('bookings', booking.toJson());
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final newBooking = Booking.fromJson(responseData['data']);
        _bookings.add(newBooking);
        notifyListeners();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessOrderScreen(booking: newBooking),
          ),
        );
      } else {
        print('Failed to add booking: ${response.statusCode}');
        print('Failed to add booking: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to book: ${response.body}'),
          ),
        );
      }
    } catch (e) {
      print('Failed to add booking: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add booking: $e'),
        ),
      );
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> updateBooking(Booking booking) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response =
          await apiService.put('bookings/${booking.id}', booking.toJson());
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final index = _bookings.indexWhere((p) => p.id == booking.id);
        if (index != -1) {
          _bookings[index] = Booking.fromJson(responseData['data']);
          notifyListeners();
        }
      }
    } catch (e) {
      print('Failed to update booking: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> deleteBooking(int bookingId) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.delete('bookings/$bookingId');
      if (response.statusCode == 200) {
        _bookings.removeWhere((booking) => booking.id == bookingId);
        notifyListeners();
      }
    } catch (e) {
      print('Failed to delete booking: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
