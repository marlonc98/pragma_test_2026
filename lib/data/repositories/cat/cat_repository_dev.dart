import 'package:pragma_test/data/repositories/cat/api/get_cat_by_id_api_impl.dart';
import 'package:pragma_test/data/repositories/cat/api/search_cat_api_impl.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/entities/search_result_entity.dart';
import 'package:pragma_test/domain/repositories/cat_repository.dart';

class CatRepositoryDev extends CatRepository {

  @override
  Future<PetitionStatusEntity<CatEntity>> getCatById(String id) =>
      getCatByIdApiImpl(id);

  @override
  Future<PetitionStatusEntity<SearchResultEntity<CatEntity>>> searchCats({
    required String query,
    required int page,
    required int itemsPerPage,
  }) => searchCatApiImpl(query: query, page: page, itemsPerPage: itemsPerPage);
}
