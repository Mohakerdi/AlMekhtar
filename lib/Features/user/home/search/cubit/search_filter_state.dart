import '../../../../../data/models/state.dart';
import '../../../../../data/models/property.dart';

class SearchFilterState {
  final Location? governorate;
  final String? area;
  final double minCost;
  final double maxCost;
  final double minArea;
  final double maxArea;
  final double minRate;
  final double maxRate;
  final String order;


  final List<Property>? properties;
  final bool isLoading;
  final String? errorMessage;

  const SearchFilterState({
    required this.governorate,
    required this.area,
    required this.minCost,
    required this.maxCost,
    required this.minArea,
    required this.maxArea,
    required this.minRate,
    required this.maxRate,
    required this.order,

    this.properties,
    this.isLoading = false,
    this.errorMessage,
  });

  factory SearchFilterState.initial() {
    return SearchFilterState(
      governorate: Location.Damascus,
      area: syrianStates[0].areas.isNotEmpty ? syrianStates[0].areas[0] : null,
      minCost: 40.0,
      maxCost: 60.0,
      minArea: 70.0,
      maxArea: 120.0,
      minRate: 1.0,
      maxRate: 3.0,
      order: 'asc',
      properties: null,
      isLoading: false,
      errorMessage: null,
    );
  }

  SearchFilterState copyWith({
    Location? governorate,
    String? area,
    double? minCost,
    double? maxCost,
    double? minArea,
    double? maxArea,
    double? minRate,
    double? maxRate,
    String? order,
    List<Property>? properties,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SearchFilterState(
      governorate: governorate ?? this.governorate,
      area: area ?? this.area,
      minCost: minCost ?? this.minCost,
      maxCost: maxCost ?? this.maxCost,
      minArea: minArea ?? this.minArea,
      maxArea: maxArea ?? this.maxArea,
      minRate: minRate ?? this.minRate,
      maxRate: maxRate ?? this.maxRate,
      order: order ?? this.order,

      properties: properties ?? this.properties,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}