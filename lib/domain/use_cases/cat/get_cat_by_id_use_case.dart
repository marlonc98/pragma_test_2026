
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/repositories/cat_repository.dart';

class GetCatByIdUseCase {
  CatRepository catRepository;

  GetCatByIdUseCase({
    required this.catRepository,
  });

  Future<PetitionStatusEntity<CatEntity>> call(String id) async {
    return catRepository.getCatById(id);
  }
}
