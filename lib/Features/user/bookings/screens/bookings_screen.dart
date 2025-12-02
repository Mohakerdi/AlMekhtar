import 'package:flutter/material.dart';
import 'package:mabeet/data/models/property.dart';

class BookingsScreen extends StatelessWidget {
  List<Property> apartments = [
    Property(
      title: "Modern Property in Damascus",
      location: "Damascus",
      imageURL: "assets/imageURLs/apartment 1.jpg",
      costPerNight: 200000.0,
      avgRate: 100.0,
      description:
          "Spacious and beautiful apartment with a wonderful city view.",
      rooms: 3,
    ),
    Property(
      title: "Luxury Property Near Downtown",
      location: "Damascus",
      imageURL: "assets/imageURLs/apartment 1.jpg",
      costPerNight: 250000.0,
      avgRate: 120.0,
      description: "Modern apartment with elegant interior design.",
      rooms: 4,
    ),
    Property(
      title: "Comfortable Family Property",
      location: "Damascus",
      imageURL: "assets/imageURLs/apartment 1.jpg",
      costPerNight: 180000.0,
      avgRate: 90.0,
      description: "Small and cozy apartment suitable for small families.",
      rooms: 2,
    ),
    Property(
      title: "Property with Large Balcony",
      location: "Damascus",
      imageURL: "assets/imageURLs/apartment 1.jpg",
      costPerNight: 220000.0,
      avgRate: 110.0,
      description: "Property with a spacious balcony overlooking the garden.",
      rooms: 3,
    ),
    Property(
      title: "Luxury Property Near the Market",
      location: "Damascus",
      imageURL: "assets/imageURLs/apartment 1.jpg",
      costPerNight: 300000.0,
      avgRate: 130.0,
      description: "Luxury apartment with all modern amenities.",
      rooms: 4,
    ),

    Property(
      title: "Distinctive Property in Aleppo",
      location: "Aleppo",
      imageURL: "assets/imageURLs/apartment 2.jpg",
      costPerNight: 170000.0,
      avgRate: 85.0,
      description: "Small modern apartment suitable for small families.",
      rooms: 2,
    ),
    Property(
      title: "Luxury Property with Modern Design",
      location: "Aleppo",
      imageURL: "assets/imageURLs/apartment 2.jpg",
      costPerNight: 190000.0,
      avgRate: 95.0,
      description: "Fully equipped apartment with contemporary design.",
      rooms: 3,
    ),
    Property(
      title: "Property Close to Services",
      location: "Aleppo",
      imageURL: "assets/imageURLs/apartment 2.jpg",
      costPerNight: 160000.0,
      avgRate: 80.0,
      description: "Small apartment suitable for students or small families.",
      rooms: 2,
    ),
    Property(
      title: "Spacious Property with Good Lighting",
      location: "Aleppo",
      imageURL: "assets/imageURLs/apartment 2.jpg",
      costPerNight: 200000.0,
      avgRate: 100.0,
      description:
          "Spacious apartment with large windows providing excellent lighting.",
      rooms: 3,
    ),
    Property(
      title: "Excellent Property in a Quiet Location",
      location: "Aleppo",
      imageURL: "assets/imageURLs/apartment 2.jpg",
      costPerNight: 210000.0,
      avgRate: 105.0,
      description: "Luxury apartment in a quiet and distinctive avgRate.",
      rooms: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: apartments.length,
        itemBuilder: (context, index) {
          final apartment = apartments[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                apartment.imageURL,
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Text(apartment.title),
              subtitle: Text(
                "${apartment.location}     \$${apartment.costPerNight}",
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
