import 'package:bloc/bloc.dart';
import 'package:mabeet/Features/user/favorites/services/data/favorite_rep.dart';
import 'package:mabeet/data/models/property.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository repo;

  FavoriteCubit(this.repo) : super(FavoriteInitial());

  List favoritesList = [];

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
      await repo.toggleFavorite(property.propertyId);
    } catch (e) {
      if (isExist)
        favoritesList.add(property);
      else
        favoritesList.removeWhere(
          (item) => item.propertyId == property.propertyId,
        );

      emit(FavoriteLoaded(List.from(favoritesList)));

      emit(FavoriteError("error in favorite loading"));
    }
  }

  void removeWithSwipe(String id) async {
    toggleFav(favoritesList.firstWhere((e) => e.propertyId == id));
  }

  bool isFavorite(int id) {
    return favoritesList.any((element) => element.propertyId == id);
  }
}
