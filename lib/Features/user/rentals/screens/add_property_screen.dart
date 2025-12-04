import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/chat/screens/chat_screen.dart';
import 'package:mabeet/Features/user/notifications/screens/notifications_screen.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  Location? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Add new property"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => const NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (builder) => const Chatscreen()),
              );
            },
            icon: const Icon(Icons.chat),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter your property title",
                  labelStyle: TextStyle(color: AppColors.gray400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Location",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray950,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: DropdownButton<Location>(
                value: selectedLocation,
                hint: const Text("Select Location"),
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down),
                borderRadius: BorderRadius.circular(12),

                items: Location.values.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location.name),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 10,
                minLines: 3,
                decoration: InputDecoration(
                  labelText: "Enter your property location description",
                  labelStyle: TextStyle(color: AppColors.gray400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 10,
                minLines: 3,
                decoration: InputDecoration(
                  labelText: "Enter your property description",
                  labelStyle: TextStyle(color: AppColors.gray400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(onPressed: () {}, child: Text("add")),
            ),
          ],
        ),
      ),

      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("add"),
        backgroundColor: AppColors.primary700,
        extendedPadding: EdgeInsets.symmetric(horizontal: 130),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }
}
