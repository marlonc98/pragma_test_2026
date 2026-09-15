import 'dart:convert';

import 'package:pragma_test/data/settings/cat_api.dart';
import 'package:pragma_test/data/dtos/cat_dto.dart';
import 'package:pragma_test/domain/contstants/errors_constants.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';

Future<PetitionStatusEntity<CatEntity>> getCatByIdApiImpl(String id) async {
  try {
    String relativeUrl = "/breeds/$id";
    String responseText = await CatApi().get(relativeUrl);
    if (responseText == "INVALID_DATA") {
      return PetitionStatusEntity.fromError(ErrorsConstants.errorGettingCat);
    }
    Map<String, dynamic> responseJson = jsonDecode(responseText);
    CatEntity cat = CatDto.fromJSON(responseJson);
    return PetitionStatusEntity.success(data: cat);
  } catch (e) {
    return PetitionStatusEntity.fromError(
      e,
      defaultError: ErrorsConstants.errorGettingCat,
    );
  }
}
