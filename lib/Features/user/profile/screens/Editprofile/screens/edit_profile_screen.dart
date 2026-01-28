import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/screens/profile_screen.dart';
import 'package:mabeet/core/config/image_utils.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/constants/strings.dart';
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

  @override
  void initState() {
    super.initState();
    if (!widget.isCreationMode) {
      _loadExistingProfileData();
    }
  }

  void _loadExistingProfileData() {
    final cubit = context.read<UserCubit>();
    final profile = cubit.currentProfile;

    if (profile != null) {
      cubit.firstName.text = profile.firstName;
      cubit.lastName.text = profile.lastName;
      cubit.birthDate.text = profile.birthDate ?? '';
    }
  }

  void _pickImage(BuildContext context, bool isAvatar) async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
    if (picked == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Optimizing image...'), duration: Duration(seconds: 2)),
    );

    final XFile? compressed = await ImageUtils.compressImage(
      picked,
      quality: isAvatar ? 82 : 72,
      maxWidth: isAvatar ? 900 : 1400,
      maxHeight: isAvatar ? 900 : 1400,
      format: CompressFormat.jpeg,
    );

    if (compressed == null) {
      return;
    }

    context.read<UserCubit>().selectImage(
      image: compressed,
      isAvatar: isAvatar,
    );
  }

  Widget _buildImagePreview(XFile? file) {
    if (file == null) {
      return const Icon(AppIcons.cloudUpload, size: 40, color: Colors.grey);
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
    final existingProfile = cubit.currentProfile;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCreationMode
              ? '${AppStrings.create.tr()} ${AppStrings.profileScreenTitle.tr()}'
              : AppStrings.menuEditProfile.tr(),
        ),
        backgroundColor: AppColors.primary500,
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is ProfileCreationRequired) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    const EditProfileScreen(isCreationMode: true),
              ),
            );
          }

          if (state is CreateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.profileSaveSuccess.tr())),
            );
            context.read<UserCubit>().getUserProfile();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (builder) => ProfileScreen()),
            );
          } else if (state is CreateProfileFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }

          if (state is UpdateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.profileUpdateSuccess.tr())),
            );
            Navigator.of(context).pop();
          } else if (state is UpdateProfileFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
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
                      current is UploadAvatarPic ||
                      current is GetUserSuccess ||
                      current is UpdateProfileSuccess,
                  builder: (context, state) {
                    final avatarFile = cubit.avatarPic;
                    final networkAvatarUrl = existingProfile?.avatarUrl;

                    ImageProvider imageSource;
                    if (avatarFile != null) {
                      imageSource = FileImage(File(avatarFile.path));
                    } else if (networkAvatarUrl != null &&
                        networkAvatarUrl.isNotEmpty) {
                      imageSource = NetworkImage(networkAvatarUrl);
                    } else {
                      imageSource = const AssetImage(AppImages.kLogoPath);
                    }

                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: imageSource,
                          child:
                              (avatarFile == null &&
                                  (networkAvatarUrl == null ||
                                      networkAvatarUrl.isEmpty))
                              ? const Icon(
                                  AppIcons.profileIcon,
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
                              icon: const Icon(
                                AppIcons.editIcon,
                                color: Colors.white,
                              ),
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
                decoration:  InputDecoration(
                  labelText: AppStrings.firstName.tr(),
                  prefixIcon: Icon(AppIcons.inactiveProfileIcon),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: cubit.lastName,
                decoration: InputDecoration(
                  labelText: AppStrings.lastName.tr(),
                  prefixIcon: Icon(AppIcons.inactiveProfileIcon),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: cubit.birthDate,
                readOnly: !widget.isCreationMode,
                decoration: InputDecoration(
                  labelText: '${AppStrings.birthDate.tr()} (YYYY-MM-DD)',
                  prefixIcon: const Icon(AppIcons.startDate),
                  border: const OutlineInputBorder(),
                  suffixIcon: widget.isCreationMode
                      ? IconButton(
                          icon: const Icon(AppIcons.editCalender),
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              cubit.birthDate.text =
                                  '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
                            }
                          },
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 30),
              if (isCreationMode) ...[
                Text(
                  AppStrings.uploadId.tr(),
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
                                      AppIcons.uploadFile,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(AppStrings.uploadId.tr()),
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
                  cubit.saveProfile(isCreation: isCreationMode);
                },
                icon: const Icon(AppIcons.save),
                label: Text(
                  isCreationMode
                      ? '${AppStrings.create.tr()} ${AppStrings.profileScreenTitle.tr()}'
                      : AppStrings.saveChanges.tr(),
                ),
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
