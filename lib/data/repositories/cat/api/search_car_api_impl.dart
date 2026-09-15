import 'dart:convert';

import 'package:pragma_test/data/settings/cat_api.dart';
import 'package:pragma_test/data/dtos/cat_dto.dart';
import 'package:pragma_test/domain/contstants/errors_constants.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/entities/search_result_entity.dart';

Future<PetitionStatusEntity<SearchResultEntity<CatEntity>>> searchCatApiImpl({
  required String query,
  required int page,
  required int itemsPerPage,
}) async {
  try {
    String endPoint = query.isEmpty ? "/breeds" : "/breeds/search";
    String params = "?limit=$itemsPerPage&page=$page&has_breeds=1";
    if (query.isNotEmpty) params += "&q=$query";
    String relativeUrl = endPoint + params;
    String responseText = await CatApi().get(relativeUrl);
    if (responseText == "INVALID_DATA") {
      return PetitionStatusEntity.fromError(ErrorsConstants.errorGettingCats);
    }
    List<dynamic> responseJson = jsonDecode(responseText);
    List<CatEntity> cats =
        responseJson.map((e) => CatDto.fromJSON(e)).toList();
    SearchResultEntity<CatEntity> result = SearchResultEntity(
      currentPage: page,
      totalItems: cats.length,
      data: cats,
      itemsPerPage: itemsPerPage,
      lastpage: 1,
    );
    return PetitionStatusEntity.success(data: result);
  } catch (e) {
    return PetitionStatusEntity.fromError(
      e,
      defaultError: ErrorsConstants.errorGettingCats,
    );
  }
}
