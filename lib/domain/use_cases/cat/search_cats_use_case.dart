import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/entities/search_result_entity.dart';
import 'package:pragma_test/domain/repositories/cat_repository.dart';

class SearchCatsUseCase {
  final CatRepository catRepository;

  SearchCatsUseCase({
    required this.catRepository,
  });

  Future<PetitionStatusEntity<SearchResultEntity<CatEntity>>> call({
      required String query, required int page, required int itemsPerPage
  }) async {
    return catRepository.searchCats(itemsPerPage: itemsPerPage, page: page, query: query);
  }
}
