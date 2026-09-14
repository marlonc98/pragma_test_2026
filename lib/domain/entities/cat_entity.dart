class CatEntity {
  String id;
  String name;
  String? origin;
  String? countryCode;
  String? description;
  String image;
  String? lifeSpan;
  String? weight;
  int? adaptability;
  int? intelligence;
  int? affectionLevel;
  int? childFriendly;
  String? temperament;
  String? oneCharacteristic;

  CatEntity({
    required this.id,
    required this.name,
    required this.image,
    this.origin,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.weight,
    this.adaptability,
    this.intelligence,
    this.affectionLevel,
    this.childFriendly,
    this.temperament,
    this.oneCharacteristic,
  });
}
