import 'package:mabeet/core/constants/images.dart';

import 'state.dart';

class Property {
  final int propertyId;
  final String title;
  final List<String> imageURLs;
  final String description;
  final String describedLocation;
  final double costPerNight;
  final double area;
  final Location state;
  final String city;
  final double avgRate;
  final int floor;

  Property({
    required this.propertyId,
    required this.title,
    required this.imageURLs,
    required this.description,
    required this.describedLocation,
    required this.costPerNight,
    required this.area,
    required this.state,
    required this.city,
    required this.avgRate,
    required this.floor,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    // دالة مساعدة لتحويل النص إلى Enum بأمان
    Location mapState(String? stateName) {
      return Location.values.firstWhere(
        (e) => e.name == stateName,
        orElse: () => Location.Damascus,
      );
    }

    return Property(
      propertyId: int.tryParse(json['id'].toString()) ?? 0,

      costPerNight: double.tryParse(json['price'].toString()) ?? 0.0,
      avgRate: double.tryParse(json['rate'].toString()) ?? 0.0,
      area: double.tryParse(json['area'].toString()) ?? 0.0,
      floor: int.tryParse(json['floor'].toString()) ?? 0,

      city: json['enCity']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      describedLocation: json['address_description']?.toString() ?? '',

      state: mapState(json['enState']?.toString()),

      imageURLs: json['images'] is List
          ? List<String>.from(json['images'].map((item) => item.toString()))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': costPerNight,
      'floor': floor,
      'enCity': city,
      'enState': state,
      'images': imageURLs,
      'description': description,
      'address_described': describedLocation,
      'area': area,
    };
  }
}
