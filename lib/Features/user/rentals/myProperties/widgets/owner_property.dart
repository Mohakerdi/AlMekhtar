import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/property/screens/property_screen.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/screens/add_property_screen.dart';
import 'package:mabeet/Features/user/rentals/services/owner_cubit.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';

class OwnerProperty extends StatelessWidget {
  const OwnerProperty({super.key, required this.property});

  final Property property;

  void _goToPropertyScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PropertyScreen(property: property, isOwner: true,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String locationName =
        '${property.state.name}, ${property.city}';

    return InkWell(
      onTap: () => _goToPropertyScreen(context),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: property.imageURLs[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                property.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              AppIcons.location,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              locationName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall!.copyWith(
                                color: AppColors.gray600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Price
                            Text(
                              '\$${property.costPerNight}/${AppStrings.night.tr()}',
                              style: textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary900,
                              ),
                            ),
                            // Rating
                            Row(
                              children: [
                                Icon(
                                  AppIcons.star,
                                  size: 18,
                                  color: AppColors.warning700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${property.avgRate}',
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50,),
                  _buildDeleteButton(context),
                  _buildEditButton(context),
                  SizedBox(width: 50,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildDeleteButton(BuildContext context) {
    final OwnerCubit cubit = context.read<OwnerCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 80,
        child: OutlinedButton(
          onPressed: () async {
            final bool? confirmed = await showDeleteConfirmationDialog(
              context,
              property.title,
            );
            if (confirmed == true) {
              cubit.deleteProperty(property.propertyId).then((successMessage) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(successMessage)));
              });
            }
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.error700,
            side: const BorderSide(color: AppColors.error700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(4),
          ),
          child: const Icon(AppIcons.exitIcon, size: 20),
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 80,
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => AddPropertyScreen(
                  propertyToEdit: property,
                ),
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.edit,
            side: const BorderSide(color: AppColors.edit),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(4),
          ),
          child: const Icon(AppIcons.editIcon, size: 20),
        ),
      ),
    );
  }

  Future<bool?> showDeleteConfirmationDialog(BuildContext context, String propertyTitle) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${AppStrings.delete.tr()} $propertyTitle'),
          content: Text(
            '${AppStrings.deletePropertyConfirmation.tr()} "$propertyTitle"? ${AppStrings.actionCannotBeUndone.tr()}',
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppStrings.cancel.tr(),
                style: TextStyle(color: AppColors.gray700),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error700,
              ),
              child: Text(
                AppStrings.delete.tr(),
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
