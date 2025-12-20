import 'property.dart';
class SearchModel {
  final String message;
  final List<Property> data;

  SearchModel({
    required this.message,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'] as List<dynamic>;

    final List<Property> properties = dataList
        .map((e) => Property.fromJson(e as Map<String, dynamic>))
        .toList();

    return SearchModel(
      message: json['message'] as String,
      data: properties,
    );
  }
}