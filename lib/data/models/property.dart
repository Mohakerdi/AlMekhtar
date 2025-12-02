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
    required this.imageURL,
    required this.description,
    required this.describedLocation,
    required this.costPerNight,
    required this.location,
    required this.avgRate,
  });

  final String id;
  final String title;
  final String imageURL;
  final String description;
  final String describedLocation;
  final double costPerNight;
  final Location location;
  final double avgRate;
}
