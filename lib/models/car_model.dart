class Car {
  int? id;
  String? brand;
  String? name;
  String? type;
  String? fuel;
  String? transmission;
  int? seat;
  String? description;
  String? image;
  int? year;
  String? licensePlate;
  int? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Car({
    this.id,
    this.brand,
    this.name,
    this.type,
    this.fuel,
    this.transmission,
    this.seat,
    this.description,
    this.image,
    this.year,
    this.licensePlate,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      type: json['type'],
      fuel: json['fuel'],
      transmission: json['transmission'],
      seat: json['seat'],
      description: json['description'],
      image: json['image'],
      year: json['year'],
      licensePlate: json['license_plate'],
      price: json['price'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'name': name,
      'type': type,
      'fuel': fuel,
      'transmission': transmission,
      'seat': seat,
      'description': description,
      'image': image,
      'year': year,
      'license_plate': licensePlate,
      'price': price,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
