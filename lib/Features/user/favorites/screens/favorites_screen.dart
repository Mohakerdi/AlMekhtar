import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/favorites/services/cubit/favorite_cubit.dart';
import 'package:mabeet/Features/user/favorites/widgets/favorites_property.dart';
import 'package:mabeet/Features/user/CustomAppBar.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
            return const Center(child: CircularProgressIndicator());
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
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
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
