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
    Location mapState(String stateName) {
      return Location.values.firstWhere(
            (e) => e.name == stateName,
        orElse: () => Location.Damascus,
      );
    }

    return Property(
      propertyId: json['id'] as int,
      costPerNight: (json['price'] as num).toDouble(),
      city: json['enCity'] as String,
      state: mapState(json['enState'] as String),
      floor: json['floor'] as int,
      avgRate: (json['rate'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),

      title: json['title'] as String,
      imageURLs: json['images'] as List<String>,
      description: json['description'] as String,
      describedLocation: json['address_described'] as String,
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
      'description':description,
      'address_described': describedLocation,
      'area': area
    };
  }
}
