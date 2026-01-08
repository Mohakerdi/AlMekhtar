import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/favorites/services/cubit/favorite_cubit.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/data/models/property.dart';

class FavoriteIconButton extends StatelessWidget {
  final Property property;

  const FavoriteIconButton({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();

        final bool isFav = cubit.isFavorite(property.propertyId);

        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => cubit.toggleFav(property),

          icon: Icon(
             isFav ? AppIcons.favIcon : AppIcons.inactiveFavIcon,

            size: 25,
          ),
        );
      },
    );
  }
}
