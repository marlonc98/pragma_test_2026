import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pragma_test/domain/contstants/errors_constants.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/domain/use_cases/cat/search_cats_use_case.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/detailed_cat_page.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cats_page.dart';
import 'package:pragma_test/presentation/ui/utils/view_model.dart';
import 'package:pragma_test/presentation/ui/widgets/show_modal.dart';

class CatsPageViewModel extends ViewModel<CatsPage> {
  CatsPageViewModel({
    required super.context,
    required super.widget,
    required super.isMounted,
  }) {
    pagingController = PagingController<int, CatEntity>(
      getNextPageKey: _getNextPageKey,
      fetchPage: _fetchPage,
    );
  }

  late final PagingController<int, CatEntity> pagingController;

  String searching = "";
  final int _itemsPerPage = 10;

  void handleOnChangeQuery(String value) {
    searching = value;
    pagingController.refresh();
  }

  void handleReload() {
    pagingController.refresh();
  }

  int? _getNextPageKey(PagingState<int, CatEntity> state) {
    final lastPageLength = state.pages?.lastOrNull?.length;
    if (lastPageLength != null && lastPageLength < _itemsPerPage) return null;
    return state.nextIntPageKey;
  }

  Future<List<CatEntity>> _fetchPage(int pageKey) async {
    final response = await getIt.get<SearchCatsUseCase>().call(
      itemsPerPage: _itemsPerPage,
      query: searching,
      page: pageKey,
    );

    if (response.isError) {
      ShowModal.showSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        text: localization.translate(response.error ?? ErrorsConstants.errorGettingCats),
        error: true,
      );
      throw localization.translate(response.error ?? ErrorsConstants.errorGettingCats);
    }

    return response.data?.data ?? [];
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  void handleTapCatCard(CatEntity item) {
    Navigator.of(context).pushNamed(
      DetailedCatPage.route,
      arguments: DetailedCatPage(id: item.id),
    );
  }
}
