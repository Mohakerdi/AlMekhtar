import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/favorites/services/cubit/favorite_cubit.dart';
import 'package:mabeet/Features/user/favorites/widgets/favorites_property.dart';
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
      // prevent inherited error
      context.read<FavoriteCubit>().getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Favorites'),

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
            return const Center(child: Text("No Favorites yet"));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final property = favorites[index];
              return Dismissible(
                key: ValueKey(property.propertyId),

                direction: DismissDirection.horizontal,

                background: _buildSwipeBackground(
                  alignment: Alignment.centerLeft,
                  color: Colors.red.shade400,
                  icon: Icons.delete_outline,
                ),

                secondaryBackground: _buildSwipeBackground(
                  alignment: Alignment.centerRight,
                  color: Colors.red.shade400,
                  icon: Icons.delete_sweep,
                ),

                onDismissed: (direction) {
                  context.read<FavoriteCubit>().removeWithSwipe(
                    property.propertyId,
                  );
                },
                child: FavoritesProperty(property: property),
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
