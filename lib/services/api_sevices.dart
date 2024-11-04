import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swift_rides/helpers/sp_helper.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api';
  // final String baseUrl = 'http://127.0.0.1:8000/api/v1';

  Future<http.Response> get(String endpoint) async {
    final String? token = await SharedPreferencesHelper.getAccessToken();
    print(Uri.parse('$baseUrl/$endpoint'));
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final String? token = await SharedPreferencesHelper.getAccessToken();
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(data),
    );
    return response;
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
    final String? token = await SharedPreferencesHelper.getAccessToken();
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(data),
    );
    return response;
  }

  Future<http.Response> delete(String endpoint) async {
    final String? token = await SharedPreferencesHelper.getAccessToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
