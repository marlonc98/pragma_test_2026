import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/presentation/constants/text_constants.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cats_page_view_model.dart';
import 'package:pragma_test/presentation/ui/pages/cats/widgets/cat_card_widget.dart';
import 'package:pragma_test/presentation/ui/pages/searcher_app_bar.dart';
import 'package:provider/provider.dart';

class CatsPageScreen extends StatelessWidget {
  const CatsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CatsPageViewModel>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearcherAppBarWidget(
            title: vm.localization.translate(TextConstants.catListPageTitle),
            onSearch: vm.handleOnChangeQuery,
            waitSearch: true,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PagingListener<int, CatEntity>(
                controller: vm.pagingController,
                builder: (context, state, fetchNextPage) =>
                    PagedListView<int, CatEntity>(
                      padding: const EdgeInsets.all(0),
                      state: state,
                      fetchNextPage: fetchNextPage,
                      builderDelegate: PagedChildBuilderDelegate<CatEntity>(
                        itemBuilder: (context, item, index) => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: CatCardWidget(
                            cat: item,
                            onTap: () => vm.handleTapCatCard(item),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
