import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:swift_rides/models/car_model.dart';
import 'package:swift_rides/services/api_sevices.dart';

class CarProvider with ChangeNotifier {
  ApiService apiService = ApiService();
  List<Car> _cars = [];

  List<Car> get cars => _cars;

  bool _isFetching = false;
  bool get isFetching => _isFetching;
  Future<void> fetchCars() async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.get('cars');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _cars = data.map((item) => Car.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Failed to fetch cars: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  } 

  Future<void> addCar(Car car) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.post('cars', car.toJson());
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _cars.add(Car.fromJson(responseData['data']));
        notifyListeners();
      }
    } catch (e) {
      print('Failed to add car: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> updateCar(Car car) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.put('cars/${car.id}', car.toJson());
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final index = _cars.indexWhere((p) => p.id == car.id);
        if (index != -1) {
          _cars[index] = Car.fromJson(responseData['data']);
          notifyListeners();
        }
      }
    } catch (e) {
      print('Failed to update car: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> deleteCar(int carId) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await apiService.delete('cars/$carId');
      if (response.statusCode == 200) {
        _cars.removeWhere((car) => car.id == carId);
        notifyListeners();
      }
    } catch (e) {
      print('Failed to delete car: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
