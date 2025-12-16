import 'state.dart';
class Property {
  Property({
    required this.id,
    required this.title,
    required this.imageURLs,
    required this.description,
    required this.describedLocation,
    required this.costPerNight,
    required this.state,
    required this.area,
    required this.avgRate,
  });

  final String id;
  final String title;
  final List<String> imageURLs;
  final String description;
  final String describedLocation;
  final double costPerNight;
  final Location state;
  final String area;
  final double avgRate;
}
