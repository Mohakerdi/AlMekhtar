import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/data/models/property.dart';

class City {
  City({required this.location, required this.imageURL});
  final Location location;
  final String imageURL;
}

final List<City> cities = [
  City(location: Location.AlHasakeh, imageURL: AppImages.kHasakah),
  City(location: Location.AlRaqqa, imageURL: AppImages.kRaqqa),
  City(location: Location.Derezzor, imageURL: AppImages.kDerezzor),
  City(location: Location.Aleppo, imageURL: AppImages.kAleppo),
  City(location: Location.Idleb, imageURL: AppImages.kIdlib),
  City(location: Location.Latakia, imageURL: AppImages.kLatakia),
  City(location: Location.Tartous, imageURL: AppImages.kTartous),
  City(location: Location.Hama, imageURL: AppImages.kHama),
  City(location: Location.Homs, imageURL: AppImages.kHoms),
  City(location: Location.Damascus, imageURL: AppImages.kDamascus),
  City(location: Location.RefDemasheq, imageURL: AppImages.kRefDemasheq),
  City(location: Location.Daraa, imageURL: AppImages.kDaraa),
  City(location: Location.AlQonaytera, imageURL: AppImages.kQonaytera),
  City(location: Location.ALSwieda, imageURL: AppImages.kSweida),

];
