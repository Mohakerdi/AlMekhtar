import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/bookings/widgets/booking_property.dart';
import 'package:mabeet/Features/user/CustomAppBar.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Bookings'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyProperties.length,
        itemBuilder: (context, index) {
          final property = dummyProperties[index];
          return BookingProperty(property: property);
        },
      ),
    );
  }
}
