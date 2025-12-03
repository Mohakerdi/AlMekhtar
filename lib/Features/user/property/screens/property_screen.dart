import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import '../../../../data/models/property.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 390,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(property.imageURLs[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    property.title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray950,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${property.costPerNight.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primary700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "/Night",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.gray400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    property.location.toString().split('.').last,
                    style: TextStyle(color: AppColors.gray400, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Property Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray950,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray950,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  property.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, color: AppColors.gray400),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Rent now"),
        backgroundColor: AppColors.primary700,
        extendedPadding: EdgeInsets.symmetric(horizontal: 130),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
