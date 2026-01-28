import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/core/config/image_utils.dart';

class SelectFromGallery extends StatelessWidget {
  final List<XFile> selectedImages;
  final List<String> existingImageUrls;
  final Function(List<XFile>) onImagesChanged;
  final bool isEditMode;

  const SelectFromGallery({
    required this.selectedImages,
    required this.existingImageUrls,
    required this.onImagesChanged,
    required this.isEditMode,
    super.key,
  });

  List<Object> get currentImages => [...existingImageUrls, ...selectedImages];

  final int maxImages = 4;

  @override
  Widget build(BuildContext context) {
    final int itemCount = !isEditMode && currentImages.length < maxImages
        ? currentImages.length + 1
        : currentImages.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Property Images'),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index == currentImages.length && !isEditMode && currentImages.length<maxImages) {
              return _buildAddButton(context);
            }
            return _buildImageTile(context, index);
          },
        ),
      ],
    );
  }

  Widget _buildImageTile(BuildContext context, int index) {
    final Object imageSource = currentImages[index];

    return InkWell(
      onTap: !isEditMode? (){_removeImage(index);_pickImage(context);}:null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageSource is String)
              CachedNetworkImage(
                imageUrl: imageSource,
                fit: BoxFit.cover,
              )
            else if (imageSource is XFile)
              Image.file(
                File(imageSource.path),
                fit: BoxFit.cover,
              ),
            if (!isEditMode)
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return InkWell(
      onTap: () => _pickImage(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        ),
        child: const Center(
          child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
        ),
      ),
    );
  }

  void _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    final List<XFile> pickedFiles = await picker.pickMultiImage(
      limit: maxImages - currentImages.length + 1,
    );
    if (pickedFiles.isEmpty) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Optimizing images...'), duration: Duration(seconds: 3)),
    );

    final List<XFile> compressedFiles = [];
    for (final file in pickedFiles) {
      final XFile? compressed = await ImageUtils.compressImage(
        file,
        quality: 72,
        maxWidth: 1400,
        maxHeight: 1400,
        format: CompressFormat.jpeg,
      );

      if (compressed != null) {
        compressedFiles.add(compressed);
      } else {
        compressedFiles.add(file);
      }
    }

    final List<XFile> updatedSelectedImages = [...selectedImages, ...compressedFiles];
    onImagesChanged(updatedSelectedImages);
  }

  void _removeImage(int index) {
    if (index < existingImageUrls.length) return;
    final int localIndex = index - existingImageUrls.length;
    final updated = List<XFile>.from(selectedImages)..removeAt(localIndex);
    onImagesChanged(updated);
  }

}
