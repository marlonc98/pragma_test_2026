import 'package:pragma_test/domain/entities/cat_entity.dart';

class CatDto {
  static CatEntity fromJSON(Map<String, dynamic> json) {
    return CatEntity(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      countryCode: json['country_code'],
      image: json['image_url'] ??
          "https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg",
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      description: json['description'],
      intelligence: json['intelligence'],
      lifeSpan: json['life_span'],
      weight: json['weight']?['metric'],
      temperament: json['temperament'],
      oneCharacteristic: json['temperament']?.split(',').first,
    );
  }
}
