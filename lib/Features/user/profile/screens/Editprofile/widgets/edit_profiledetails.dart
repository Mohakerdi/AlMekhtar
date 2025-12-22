import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class EditProfileShowDetails extends StatefulWidget {
  const EditProfileShowDetails({super.key});

  @override
  State<EditProfileShowDetails> createState() => _EditProfileShowDetailsState();
}

class _EditProfileShowDetailsState extends State<EditProfileShowDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/appprofile.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary500,
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

          const SizedBox(height: 20),

          TextFormField(
            keyboardType: TextInputType.phone,
            initialValue: '+963 ',
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Icons.badge_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),

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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
