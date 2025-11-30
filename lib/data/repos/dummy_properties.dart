
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/data/models/property.dart';

final List<Property> dummyProperties = [
  Property(id: '1', title: 'Eagle Nest', imageURL: AppImages.kDyarImage, costPerNight: 22.5, location: Location.Damascus,describedLocation: 'Berlin, 1944',description: '',avgRate: 3.5),
  Property(id: '2', title: 'Twin Tower', imageURL: AppImages.kDyarImage, costPerNight: 15, location: Location.ALSwieda,describedLocation: 'well, it WAS not is (;',description: '',avgRate: 5.1),
  Property(id: '3', title: 'CJ\'s House', imageURL: AppImages.kDyarImage, costPerNight: 100, location: Location.Tartous,describedLocation: 'Groove Street',description: 'Ba3d el jeser',avgRate: 4.4),
  Property(id: '4', title: 'Foster\'s House for imaginary friends' , imageURL: AppImages.kDyarImage, costPerNight: 35, location: Location.RefDemasheq,describedLocation: 'in our hearts',description: 'Cartoon network',avgRate: 3.9)
];
