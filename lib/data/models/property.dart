import 'package:mabeet/core/constants/images.dart';

import '../../core/api/api_constants.dart';
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

    String? getFullImageUrl(String? path) {
      if (path == null || path.isEmpty) return null;
      return '${ApiConstants.StorageBaseUrl}$path';
    }

    double parsePrice(String? priceString) {
      if (priceString == null) return 0.0;

      String numericString = priceString.replaceAll(RegExp(r'[^\d\.]'), '');

      final parts = numericString.split('.');
      if (parts.length > 2) {
        numericString = '${parts[0]}.${parts.sublist(1).join('')}';
      }

      return double.tryParse(numericString) ?? 0.0;
    }

    return Property(
      propertyId: int.tryParse(json[ApiKey.id].toString()) ?? 0,

      costPerNight: parsePrice(json[ApiKey.price]?.toString()),
      avgRate: double.tryParse(json[ApiKey.rate].toString()) ?? 0.0,
      area: double.tryParse(json[ApiKey.area].toString()) ?? 0.0,
      floor: int.tryParse(json[ApiKey.floor].toString()) ?? 0,

      city: json[ApiKey.city]?.toString() ?? '',
      title: json[ApiKey.title]?.toString() ?? '',
      description: json[ApiKey.description]?.toString() ?? '',
      describedLocation: json[ApiKey.addressDescribed]?.toString() ?? '',

      state: mapState(json[ApiKey.state]?.toString()),

      imageURLs: json[ApiKey.images] is List
          ? List<String>.from(json[ApiKey.images].map((item) => getFullImageUrl(item.toString())))
          : [],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      ApiKey.title: title,
      ApiKey.price: costPerNight,
      ApiKey.floor: floor,
      ApiKey.city: city,
      ApiKey.state: state,
      ApiKey.images: imageURLs,
      ApiKey.description: description,
      ApiKey.addressDescribed: describedLocation,
      ApiKey.area: area,
    };
  }
}
