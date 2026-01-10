import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/favorites/services/cubit/favorite_cubit.dart';
import 'package:mabeet/Features/user/favorites/widgets/favorites_property.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/widgets/CustomAppBar.dart';
import 'package:mabeet/core/widgets/shimmer_loading_property.dart';
import 'package:mabeet/core/constants/strings.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: AppStrings.favoritesScreenTitle.tr()),

      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const PropertyShimmer();
              },
            );
          }
          final favorites = context.read<FavoriteCubit>().favoritesList;
          if (favorites.isEmpty) {
            return Center(child: Text(AppStrings.emptyFav.tr()));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final property = favorites[index];
              return Column(
                children: [
                  Dismissible(
                    key: ValueKey(property.propertyId),

                    direction: DismissDirection.horizontal,

                    background: _buildSwipeBackground(
                      alignment: Alignment.centerLeft,
                      color: Colors.red.shade400,
                      icon: AppIcons.delete,
                    ),

                    onDismissed: (direction) {
                      context.read<FavoriteCubit>().removeWithSwipe(
                        property.propertyId,
                      );
                    },
                    child: FavoritesProperty(property: property),
                  ),
                  if(index != favorites.length-1) Divider()
                ],
              );
            },
          );
        },
      ),
    ); //
  }
}

Widget _buildSwipeBackground({
  required Alignment alignment,
  required Color color,
  required IconData icon,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    alignment: alignment,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Icon(icon, color: Colors.white, size: 30),
  );
}
