import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/data/models/property.dart';

import '../models/state.dart';

final List<Property> dummyProperties = [
  Property(
    propertyId: '1',
    title: 'Eagle Nest',
    imageURLs: [
      AppImages.kEagleNest,
      AppImages.kTwinTowers,
      AppImages.kGrooveStreet,
      AppImages.kFosterHouse,
    ],
    costPerNight: 22.5,
    state: Location.Damascus,
    area: 'Al-Midan',
    describedLocation:
        'Berlin, 1944, aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    description:
        'Perched high above the city, Eagle Nest offers a serene escape from the hustle and bustle of everyday life. Enjoy breathtaking panoramic views, cozy interiors, and a perfect spot for morning coffee or sunset relaxation. Ideal for couples or solo travelers looking for peace, quiet, and inspiration.',
    avgRate: 3.5,
  ),

  Property(
    propertyId: '2',
    title: 'Twin Tower',
    imageURLs: [
      AppImages.kTwinTowers,
      AppImages.kTwinTowers,
      AppImages.kTwinTowers,
      AppImages.kTwinTowers,
    ],
    costPerNight: 15,
    state: Location.AsSuwayda,
    area: 'Salkhad',
    describedLocation: 'well, it WAS not is (;',
    description:
        'Twin Tower is a modern apartment designed for comfort and convenience. Featuring spacious rooms, stylish decor, and all the amenities you need for a pleasant stay, it’s perfect for business travelers, friends, or families. Located close to shops, cafes, and public transport, you can explore the city with ease while returning to a peaceful retreat at the end of the day.',
    avgRate: 5.1,
  ),

  Property(
    propertyId: '3',
    title: 'CJ\'s House',
    imageURLs: [
      AppImages.kGrooveStreet,
      AppImages.kGrooveStreet,
      AppImages.kGrooveStreet,
      AppImages.kGrooveStreet,
    ],
    costPerNight: 100,
    state: Location.Tartous,
    area: 'Baniyas',
    describedLocation: 'Groove Street',
    description:
        'CJ\'s House is a vibrant and lively home that combines comfort with character. Located in a friendly neighborhood with easy access to local attractions, this house offers a unique atmosphere full of charm and personality. Enjoy spacious living areas, cozy bedrooms, and a welcoming space perfect for gatherings with friends or family. A true gem for anyone looking to experience the city in a special way.',
    avgRate: 4.4,
  ),

  Property(
    propertyId: '4',
    title: 'Foster\'s House for imaginary friends',
    imageURLs: [
      AppImages.kFosterHouse,
      AppImages.kFosterHouse,
      AppImages.kFosterHouse,
      AppImages.kFosterHouse,
    ],
    costPerNight: 35,
    state: Location.RifDimashq,
    area: 'Douma',
    describedLocation: 'in our hearts',
    description:
        'Step into a whimsical world at Foster\'s House for imaginary friends, where imagination and fun come alive. This playful home is perfect for families, kids, or anyone young at heart. With colorful interiors, unique decorations, and cozy corners for reading or relaxing, every moment here is full of joy. Experience a stay unlike any other, where creativity and comfort blend seamlessly.',
    avgRate: 3.9,
  ),
  Property(
    propertyId: '1',
    title: 'Eagle Nest',
    imageURLs: [
      AppImages.kEagleNest,
      AppImages.kTwinTowers,
      AppImages.kGrooveStreet,
      AppImages.kFosterHouse,
    ],
    costPerNight: 22.5,
    state: Location.Damascus,
    area: 'Old Damascus',
    describedLocation: 'Berlin, 1944',
    description:
        'Perched high above the city, Eagle Nest offers a serene escape from the hustle and bustle of everyday life. Enjoy breathtaking panoramic views, cozy interiors, and a perfect spot for morning coffee or sunset relaxation. Ideal for couples or solo travelers looking for peace, quiet, and inspiration.',
    avgRate: 3.5,
  ),

  Property(
    propertyId: '2',
    title: 'Twin Tower',
    imageURLs: [
      AppImages.kTwinTowers,
      AppImages.kTwinTowers,
      AppImages.kTwinTowers,
      AppImages.kTwinTowers,
    ],
    costPerNight: 15,
    state: Location.Daraa,
    area: 'Salkhad',
    describedLocation: 'well, it WAS not is (;',
    description:
        'Twin Tower is a modern apartment designed for comfort and convenience. Featuring spacious rooms, stylish decor, and all the amenities you need for a pleasant stay, it’s perfect for business travelers, friends, or families. Located close to shops, cafes, and public transport, you can explore the city with ease while returning to a peaceful retreat at the end of the day.',
    avgRate: 5.1,
  ),

  Property(
    propertyId: '3',
    title: 'CJ\'s House',
    imageURLs: [
      AppImages.kGrooveStreet,
      AppImages.kGrooveStreet,
      AppImages.kGrooveStreet,
      AppImages.kGrooveStreet,
    ],
    costPerNight: 100,
    state: Location.Tartous,
    area: 'Safita',
    describedLocation: 'Groove Street',
    description:
        'CJ\'s House is a vibrant and lively home that combines comfort with character. Located in a friendly neighborhood with easy access to local attractions, this house offers a unique atmosphere full of charm and personality. Enjoy spacious living areas, cozy bedrooms, and a welcoming space perfect for gatherings with friends or family. A true gem for anyone looking to experience the city in a special way.',
    avgRate: 4.4,
  ),

  Property(
    propertyId: '4',
    title: 'Foster\'s House for imaginary friends',
    imageURLs: [
      AppImages.kFosterHouse,
      AppImages.kFosterHouse,
      AppImages.kFosterHouse,
      AppImages.kFosterHouse,
    ],
    costPerNight: 35,
    state: Location.RifDimashq,
    area: 'Qudsaya',
    describedLocation: 'in our hearts',
    description:
        'Step into a whimsical world at Foster\'s House for imaginary friends, where imagination and fun come alive. This playful home is perfect for families, kids, or anyone young at heart. With colorful interiors, unique decorations, and cozy corners for reading or relaxing, every moment here is full of joy. Experience a stay unlike any other, where creativity and comfort blend seamlessly.',
    avgRate: 3.9,
  ),
];
