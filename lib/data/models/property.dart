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
  final String id;
  final String title;
  final String imageURL;
  final String description;
  final String describedLocation;
  final double costPerNight;
  final Location location;
  final double avgRate;

  Property({
    required this.title,
    required this.location,
    required this.imageURL,
    required this.costPerNight,
    required this.avgRate,
    required this.description,
    required this.rooms,
  });
}
