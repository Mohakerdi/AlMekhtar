import 'state.dart';

class Property {
  Property({
    required this.propertyId,
    required this.title,
    required this.imageURLs,
    required this.description,
    required this.describedLocation,
    required this.costPerNight,
    required this.state,
    required this.area,
    required this.avgRate,
  });

  final String propertyId;
  final String title;
  final List<String> imageURLs;
  final String description;
  final String describedLocation;
  final double costPerNight;
  final Location state;
  final String area;
  final double avgRate;

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      propertyId: json['id'].toString(), //mabey it will need a change
      title: json['title'] ?? '',
      imageURLs: List<String>.from(json['image_urls'] ?? []),
      description: json['description'] ?? '',
      describedLocation: json['described_location'] ?? '',

      costPerNight: (json['cost_per_night'] as num?)?.toDouble() ?? 0.0,
      area: json['area']?.toString() ?? '',
      avgRate: (json['avg_rate'] as num?)?.toDouble() ?? 0.0,

      state: Location.values.firstWhere(
        (e) => e.toString().split('.').last == json['state'],
        orElse: () => Location.Damascus,
      ),
    );
  }
}
