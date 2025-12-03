enum Location {
  AlHasakeh,
  AlRaqqa,
  Derezzor,
  Aleppo,
  Idleb,
  Latakia,
  Tartous,
  Hama,
  Homs,
  Damascus,
  RefDemasheq,
  Daraa,
  AlQonaytera,
  ALSwieda,
}

class Property {
  Property({
    required this.id,
    required this.title,
    required this.imageURLs,
    required this.description,
    required this.describedLocation,
    required this.costPerNight,
    required this.location,
    required this.avgRate,
  });

  final String id;
  final String title;
  final List<String> imageURLs;
  final String description;
  final String describedLocation;
  final double costPerNight;
  final Location location;
  final double avgRate;
}
