import 'package:pragma_test/domain/contstants/errors_constants.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/entities/petition_status_entity.dart';
import 'package:pragma_test/domain/use_cases/cat/get_cat_by_id_use_case.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/detailed_cat_page.dart';
import 'package:pragma_test/presentation/ui/utils/view_model.dart';
import 'package:pragma_test/presentation/ui/widgets/show_modal.dart';

class DetailedCatPageViewModel extends ViewModel<DetailedCatPage> {
  DetailedCatPageViewModel({
    required super.context,
    required super.widget,
    required super.isMounted,
  }) {
    handleLoadCat();
  }

  PetitionStatusEntity<CatEntity> cat =
      PetitionStatusEntity<CatEntity>.loading();

  void handleLoadCat() async {
    cat = await getIt<GetCatByIdUseCase>().call(widget.id);
    if (cat.isError) {
      ShowModal.showSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        text: localization.translate(
          cat.error ?? ErrorsConstants.errorGettingCat,
        ),
        error: true,
      );
    }
    notifyListeners();
  }
}
