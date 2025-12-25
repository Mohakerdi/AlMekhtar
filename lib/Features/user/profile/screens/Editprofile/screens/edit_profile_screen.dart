import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/Features/auth/services/cubit/user_cubit.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';

class EditProfileScreen extends StatefulWidget {
  final bool isCreationMode;

  const EditProfileScreen({super.key, this.isCreationMode = true});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  void _pickImage(BuildContext context, bool isAvatar) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      context.read<UserCubit>().selectImage(
        image: pickedFile,
        isAvatar: isAvatar,
      );
    }
  }

  Widget _buildImagePreview(XFile? file) {
    if (file == null) {
      return const Icon(Icons.cloud_upload, size: 40, color: Colors.grey);
    }
    return Image.file(
      File(file.path),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    final isCreationMode = widget.isCreationMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(isCreationMode ? 'Create Profile' : 'Edit Profile'),
        backgroundColor: AppColors.primary500,
      ),

      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is ProfileCreationRequired) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EditProfileScreen(isCreationMode: true),
              ),
            );
          }
          if (state is CreateProfileLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Saving profile...')));
          } else if (state is CreateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile saved successfully!')),
            );
          } else if (state is CreateProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: BlocBuilder<UserCubit, UserState>(
                  buildWhen: (previous, current) =>
                      current is UploadAvatarPic || current is UserInitial,
                  builder: (context, state) {
                    final avatarFile = cubit.avatarPic;
                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: avatarFile != null
                              ? FileImage(File(avatarFile.path))
                              : const AssetImage('assets/images/appprofile.jpg')
                                    as ImageProvider,
                          child: avatarFile == null
                              ? const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey,
                                )
                              : null,
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
                              onPressed: () => _pickImage(context, true),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
              TextFormField(
                controller: cubit.firstName,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: cubit.lastName,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              if (isCreationMode) ...[
                TextFormField(
                  controller: cubit.birthDate,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth (YYYY-MM-DD)',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.edit_calendar),
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          cubit.birthDate.text =
                              '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
              if (isCreationMode) ...[
                Text(
                  'Upload ID Photo',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),

                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    final idPhotoFile = cubit.idPhoto;
                    return GestureDetector(
                      onTap: () => _pickImage(context, false),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: idPhotoFile == null
                                ? Colors.grey
                                : AppColors.primary500,
                            width: idPhotoFile == null ? 1 : 2,
                          ),
                        ),
                        child: Center(
                          child: idPhotoFile == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.file_upload,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Tap to upload ID Photo (required)',
                                    ),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: _buildImagePreview(idPhotoFile),
                                ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),
              ],

              ElevatedButton.icon(
                onPressed: () {
                  cubit.createProfile();
                },
                icon: const Icon(Icons.save),
                label: Text(isCreationMode ? 'Create Profile' : 'Save Changes'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
