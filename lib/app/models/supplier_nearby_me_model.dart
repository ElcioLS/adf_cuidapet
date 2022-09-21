import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SupplierNearbyMeModel {
  final int id;
  final String name;
  final String logo;
  final double fistance;
  final int category;

  SupplierNearbyMeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.fistance,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logo': logo,
      'fistance': fistance,
      'category': category,
    };
  }

  factory SupplierNearbyMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearbyMeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
      fistance: map['fistance'] as double,
      category: map['category'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearbyMeModel.fromJson(String source) =>
      SupplierNearbyMeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
