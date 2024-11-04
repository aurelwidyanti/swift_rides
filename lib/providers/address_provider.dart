import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:swift_rides/models/address_model.dart';
import 'package:swift_rides/services/api_sevices.dart';

class AddressProvider with ChangeNotifier {
  ApiService apiService = ApiService();

  List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  bool _isFetching = false;
  bool get isFetching => _isFetching;
  Future<void> fetchAddresses() async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.get('addresses');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _addresses = data.map((item) => Address.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Failed to fetch addresses: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> fetchAddressesByUser() async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.get('addresses/showByUser');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _addresses = data.map((item) => Address.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Failed to fetch addresses: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> addAddress(Address address) async {
    _isFetching = false;
    notifyListeners();
    try {
      final response = await apiService.post('addresses', address.toJson());
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _addresses.add(Address.fromJson(responseData['data']));
        notifyListeners();
      }
    } catch (e) {
      print('Failed to add address: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> updateAddress(Address address) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response =
          await apiService.put('addresses/${address.id}', address.toJson());
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final index = _addresses.indexWhere((p) => p.id == address.id);
        if (index != -1) {
          _addresses[index] = Address.fromJson(responseData['data']);
          notifyListeners();
        }
      }
    } catch (e) {
      print('Failed to update address: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> deleteAddress(int addressId) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.delete('addresses/$addressId');
      if (response.statusCode == 200) {
        _addresses.removeWhere((address) => address.id == addressId);
        notifyListeners();
      }
    } catch (e) {
      print('Failed to delete address: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
