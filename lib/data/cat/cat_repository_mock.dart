import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/entities/search_result_entity.dart';
import 'package:pragma_test/domain/repositories/cat_repository.dart';

CatEntity fakeCat = CatEntity(
  id: '3',
  name: 'Fake Cat',
  description: 'This is a fake cat',
  image: "https://cdn2.thecatapi.com/images/ebv.jpg",
  countryCode: "US",
  intelligence: 3,
);

class CatRepositoryMock extends CatRepository {
  @override
  Future<PetitionStatusEntity<CatEntity>> getCatById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return PetitionStatusEntity.success(data: fakeCat);
  }

  @override
  Future<PetitionStatusEntity<SearchResultEntity<CatEntity>>> searchCats({
    required String query,
    required int page,
    required int itemsPerPage,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    List<CatEntity> cats = List.generate(10, (index) => fakeCat);
    for (int i = 0; i < cats.length; i++) {
      cats[i].id = i.toString();
    }
    SearchResultEntity<CatEntity> searchResult = SearchResultEntity(
      currentPage: page,
      data: cats,
      itemsPerPage: itemsPerPage,
      lastpage: 10,
      totalItems: page * itemsPerPage,
    );
    return PetitionStatusEntity.success(data: searchResult);
  }
}
