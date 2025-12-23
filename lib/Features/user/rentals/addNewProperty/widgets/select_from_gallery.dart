import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/theme/app_colors.dart';

class SelectFromGallery extends StatefulWidget {
  const SelectFromGallery({super.key, required this.onSelectImage});

  final void Function(File image) onSelectImage;

  @override
  State<SelectFromGallery> createState() => _SelectFromGalleryState();
}

class _SelectFromGalleryState extends State<SelectFromGallery> {
  File? _selectedImage;

  void _getPicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    widget.onSelectImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = InkWell(
      onTap: _getPicture,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(AppIcons.upload, size: 45, color: AppColors.primary700),
            const Text('Click here to upload'),
          ],
        ),
      ),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _getPicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add Photo Or Video",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray950,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            height: 250,
            width: double.infinity,
            alignment: Alignment.center,
            child: content,
          ),
        ],
      ),
    );
  }
}
