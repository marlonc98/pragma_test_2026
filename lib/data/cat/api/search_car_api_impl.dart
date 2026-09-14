import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/entities/search_result_entity.dart';

Future<PetitionStatusEntity<SearchResultEntity<CatEntity>>> searchCatApiImpl({
  required String query,
  required int page,
  required int itemsPerPage,
}) async {
  //TODO implement
  throw UnimplementedError();
}
