import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:mabeet/data/models/booking_model.dart';
import 'package:mabeet/data/models/property.dart';

class OwnerRepository {
  final ApiConsumer api;

  OwnerRepository({required this.api});

  Future<List<Property>> getMyProperties() async {
    try {
      final response = await api.get(ApiConstants.myProperties);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => Property.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<List<Booking>> getActiveAcceptedBookings() async {
    try {
      final response = await api.get(ApiConstants.renterActive);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => Booking.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<List<Booking>> getHistoryBookings() async {
    try {
      final response = await api.get(ApiConstants.renterHistory);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => Booking.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<String> deleteProperty(int id) async {
    try {
      final endpoint = 'apartments/$id';
      final response = await api.delete(endpoint, data: {});
      final message = response[ApiKey.message] as String;

      return message;
    } on ServerException {
      rethrow;
    }
  }

  Future<String> addProperty({
    required String title,
    required String description,
    required String price,
    required String area,
    required String floor,
    required String addressDescription,
    required String state,
    required String city,
    required String cardNumber,
    required List<XFile> images,
  }) async {
    final formData = FormData.fromMap({
      ApiKey.title: title,
      ApiKey.description: description,
      ApiKey.price: price,
      ApiKey.area: area,
      ApiKey.floor: floor,
      ApiKey.addressDescribed: addressDescription,
      ApiKey.state: state,
      ApiKey.city: city,
      ApiKey.cardNumber: cardNumber,
      'images[]': images.map(
            (image) => MultipartFile.fromFileSync(
          image.path,
          filename: image.name,
        ),
      ).toList(),
    });

    final response = await api.post(
      ApiConstants.apartment,
      data: formData,
    );

    return response[ApiKey.message] as String;
  }

  Future<String> editProperty({
    required int propertyId,
    String? title,
    String? description,
    String? price,
    String? addressDescription,
    String? cardNumber,
    List<XFile>? newImages,
  }) async {
    final data = {
      ApiKey.title: title,
      ApiKey.description: description,
      ApiKey.price: price,
      ApiKey.addressDescribed: addressDescription,
      ApiKey.cardNumber: cardNumber,
    };

    final response = await api.patch(
      '${ApiConstants.apartment}/$propertyId',
      data: data,
    );

    return response[ApiKey.message] as String;
  }

  Future<List<Booking>> getPendingBookingRequests() async {
    try {
      final response = await api.get(ApiConstants.pendingReservations);
      final List<dynamic> data = response[ApiKey.data] ?? [];

      return data
          .map((json) => Booking.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<String> acceptBooking(int bookingId) async {
    try {
      final endpoint = 'apartments/reservations/$bookingId/awaiting-payment';
      final response = await api.post(endpoint, data: {});
      final message = response[ApiKey.message] as String;
      return message;
    } on ServerException {
      rethrow;
    }
  }
}
