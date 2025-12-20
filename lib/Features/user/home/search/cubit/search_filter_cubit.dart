import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/repos/search_repo.dart';
import '../../../../../data/models/state.dart';
import 'search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {

  SearchFilterCubit({required this.searchRepo}) : super(SearchFilterState.initial());

  final SearchRepository searchRepo;

  void updateGovernorate(Location newGovernorate) {
    final stateModel = syrianStates.firstWhere(
          (state) => state.name == newGovernorate.name,
      orElse: () => syrianStates[0],
    );

    final newArea = stateModel.areas.isNotEmpty ? stateModel.areas[0] : null;

    emit(state.copyWith(
      governorate: newGovernorate,
      area: newArea,
    ));
  }

  void updateArea(String newArea) {
    emit(state.copyWith(area: newArea));
  }

  void updateCostRange(double min, double max) {
    emit(state.copyWith(minCost: min, maxCost: max));
  }

  void updateAreaRange(double min, double max) {
    emit(state.copyWith(minArea: min, maxArea: max));
  }

  void updateRateRange(double min, double max) {
    emit(state.copyWith(minRate: min, maxRate: max));
  }

  void updateOrder(String newOrder) {
    emit(state.copyWith(order: newOrder));
  }

  void resetFilters() {
    emit(SearchFilterState.initial());
  }

  Future<void> applyFilters() async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      properties: null,
    ));
      final results = await searchRepo.getFilteredResults(
        governorate: state.governorate,
        area: state.area,
        minCost: state.minCost,
        maxCost: state.maxCost,
        minArea: state.minArea,
        maxArea: state.maxArea,
        minRate: state.minRate,
        maxRate: state.maxRate,
        order: state.order,
      );
      
      results.fold(
          (errorMessage) => emit(state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to fetch search results.',
          )),
          (properties) =>emit(state.copyWith(
              isLoading: false,
              properties: properties
          ))
      );
  }
}