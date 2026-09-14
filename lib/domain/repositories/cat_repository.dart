import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/entities/search_result_entity.dart';

abstract class CatRepository {
  Future<PetitionStatusEntity<SearchResultEntity<CatEntity>>> searchCats({
    required String query,
    required int page,
    required int itemsPerPage,
  });
  Future<PetitionStatusEntity<CatEntity>> getCatById(String id);
}
