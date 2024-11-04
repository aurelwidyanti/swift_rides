class Address {
  int? id;
  int? userId;
  String? title;
  String? city;
  String? street;
  DateTime? createdAt;
  DateTime? updatedAt;

  Address(
      {this.id,
      this.userId,
      this.title,
      this.city,
      this.street,
      this.createdAt,
      this.updatedAt});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      city: json['city'],
      street: json['street'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'city': city,
      'street': street,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
