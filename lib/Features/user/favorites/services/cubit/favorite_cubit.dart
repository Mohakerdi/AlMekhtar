import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/favorites/services/data/favorite_rep.dart';
import 'package:mabeet/data/models/property.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository repo;
  FavoriteCubit(this.repo) : super(FavoriteInitial());

  List<Property> favoritesList = [];

  void getFavorites() async {
    emit(FavoriteLoading());
    try {
      favoritesList = await repo.fetchFavorites();
      emit(FavoriteLoaded(List.from(favoritesList)));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void toggleFav(Property property) async {
    final isExist = favoritesList.any(
      (item) => item.propertyId == property.propertyId,
    );

    if (isExist) {
      favoritesList.removeWhere(
        (item) => item.propertyId == property.propertyId,
      );
    } else {
      favoritesList.add(property);
    }
    emit(FavoriteLoaded(List.from(favoritesList)));

    try {
      if (isExist) {
        await repo.deleteFavorite(property.propertyId);
      } else {
        await repo.addFavorite(property.propertyId);
      }
    } catch (e) {
      if (isExist) {
        favoritesList.add(property);
      } else {
        favoritesList.removeWhere(
          (item) => item.propertyId == property.propertyId,
        );
      }

      emit(FavoriteLoaded(List.from(favoritesList)));
      emit(FavoriteError(e.toString()));
    }
  }

  void removeWithSwipe(int id) async {
    final property = favoritesList.firstWhere((e) => e.propertyId == id);
    toggleFav(property);
  }

  bool isFavorite(int id) {
    return favoritesList.any((element) => element.propertyId == id);
  }
}
