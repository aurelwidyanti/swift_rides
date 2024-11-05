import 'package:swift_rides/models/address_model.dart';
import 'package:swift_rides/models/car_model.dart';
import 'package:swift_rides/models/user_model.dart';

class Booking {
  int? id;
  int? userId;
  int? carId;
  int? addressId;
  DateTime? startDate;
  DateTime? endDate;
  int? totalPrice;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Car? car;
  Address? address;

  Booking(
      {this.id,
      this.userId,
      this.carId,
      this.addressId,
      this.startDate,
      this.endDate,
      this.totalPrice,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.car,
      this.address});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['user_id'],
      carId: json['car_id'],
      addressId: json['address_id'],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      totalPrice: json['total_price'],
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      car: json['car'] != null ? Car.fromJson(json['car']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'car_id': carId,
      'address_id': addressId,
      'start_date': startDate != null ? startDate?.toIso8601String() : null,
      'end_date': endDate != null ? endDate?.toIso8601String() : null,
      'total_price': totalPrice,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'user': user?.toJson(),
      'address': address?.toJson(),
      'car': car?.toJson(),
    };
  }
}
