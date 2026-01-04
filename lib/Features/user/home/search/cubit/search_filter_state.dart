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
  static const double _initialMinCost = 0.0;
  static const double _initialMaxCost = 100.0;
  static const double _initialMinArea = 30.0;
  static const double _initialMaxArea = 210.0;
  static const double _initialMinRate = 0.0;
  static const double _initialMaxRate = 5.0;


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
      minCost: _initialMinCost,
      maxCost: _initialMaxCost,
      minArea: _initialMinArea,
      maxArea: _initialMaxArea,
      minRate: _initialMinRate,
      maxRate: _initialMaxRate,
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
  static SearchFilterState get resetValues {
    return SearchFilterState(
      governorate: null,
      area: null,
      minCost: _initialMinCost,
      maxCost: _initialMaxCost,
      minArea: _initialMinArea,
      maxArea: _initialMaxArea,
      minRate: _initialMinRate,
      maxRate: _initialMaxRate,

      order: 'asc',

      properties: null,
      isLoading: false,
      errorMessage: null,
    );
  }

}