import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileShowDetails extends StatefulWidget {
  const EditProfileShowDetails({super.key});

  @override
  State<EditProfileShowDetails> createState() => _EditProfileShowDetailsState();
}

class _EditProfileShowDetailsState extends State<EditProfileShowDetails> {
  // Controller to manage the text in the date field
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  // --- This function shows the date picker dialog ---
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // Initial date to show
      firstDate: DateTime(1900), // The earliest selectable date
      lastDate: DateTime.now(), // The latest selectable date
    );

    // If the user picked a date, update the state
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Format the date to a readable string and update the controller
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Profile Image with Edit Icon
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/appprofile.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Change photo (Not implemented)'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Update your personal information below.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          // First Name Field
          TextFormField(
            initialValue: 'Hans',
            decoration: const InputDecoration(
              labelText: 'First Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          // Last Name Field
          TextFormField(
            initialValue: 'Landa',
            decoration: const InputDecoration(
              labelText: 'Last Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // --- NEW: Date of Birth Field ---
          TextFormField(
            controller: _dateController,
            readOnly: true, // Prevents the user from typing in the field
            decoration: const InputDecoration(
              labelText: 'Date of Birth',
              prefixIcon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
            onTap: () {
              // Show the date picker when the user taps the field
              _selectDate(context);
            },
          ),

          const SizedBox(height: 20),
          // ID Number Field
          TextFormField(
            initialValue: '123456789',
            decoration: const InputDecoration(
              labelText: 'Id Number',
              prefixIcon: Icon(
                Icons.badge_outlined,
              ), // Changed icon to be more suitable
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          // Save Button
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile saved! (Demo successful)'),
                ),
              );
            },
            icon: const Icon(Icons.save),
            label: const Text('Save Changes'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
