import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/data/models/property.dart';

class City {
  City({required this.location, required this.imageURL});
  final Location location;
  final String imageURL;
}

final List<City> cities = [
  City(location: Location.AlHasakeh, imageURL: AppImages.kDyarImage),
  City(location: Location.AlRaqqa, imageURL: AppImages.kDyarImage),
  City(location: Location.Derezzor, imageURL: AppImages.kDyarImage),
  City(location: Location.Aleppo, imageURL: AppImages.kDyarImage),
  City(location: Location.Idleb, imageURL: AppImages.kDyarImage),
  City(location: Location.Latakia, imageURL: AppImages.kDyarImage),
  City(location: Location.Tartous, imageURL: AppImages.kDyarImage),
  City(location: Location.Hama, imageURL: AppImages.kDyarImage),
  City(location: Location.Homs, imageURL: AppImages.kDyarImage),
  City(location: Location.Damascus, imageURL: AppImages.kDyarImage),
  City(location: Location.RefDemasheq, imageURL: AppImages.kDyarImage),
  City(location: Location.Daraa, imageURL: AppImages.kDyarImage),
  City(location: Location.AlQonaytera, imageURL: AppImages.kDyarImage),
  City(location: Location.ALSwieda, imageURL: AppImages.kDyarImage),

];
