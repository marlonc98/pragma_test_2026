import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/constants/text_constants.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/detailed_cat_page_view_model.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/widgets/cat_feature_item_widget.dart';
import 'package:pragma_test/presentation/ui/widgets/images/image_network_with_load_widget.dart';
import 'package:pragma_test/presentation/ui/widgets/list_item_widget.dart';
import 'package:pragma_test/presentation/ui/widgets/loaders_status/loader_screen_widget.dart';
import 'package:provider/provider.dart';

class DetailedCatPageScreen extends StatelessWidget {
  const DetailedCatPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DetailedCatPageViewModel>();
    final i18n = context.watch<LocalizationStateImpl>();
    return Scaffold(
      appBar: AppBar(
        title: Text(vm.cat.data?.name ?? i18n.translate(TextConstants.detailedCatPageDefaultTitle)),
      ),
      body: LoaderScreenWidget(status: vm.cat,
      noResultsScreen: true,
      onRetry: vm.handleLoadCat,
      builder: (context, cat)=>
       Column(
              children: [
                ImageNetworkWithLoadWidget(
                  cat.image,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
                Expanded(
                    child: Container(
                  transform: Matrix4.translationValues(0, -20, 0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.5),
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: const Alignment(0, 0.01),
                      ),
                    ),
                    child: ListView(
                      children: [
                        if (vm.cat.data!.description != null)
                          ListItemWidget(
                            title: vm.localization.translate(
                                TextConstants.detailedCatPageDescription),
                            value: vm.cat.data!.description ?? "",
                          ),
                        if (vm.cat.data!.origin != null)
                          ListItemWidget(
                            title: vm.localization.translate(
                                TextConstants.detailedCatPageOrigin),
                            value: vm.cat.data!.origin ?? "",
                          ),
                        if (vm.cat.data!.temperament != null)
                          ListItemWidget(
                              title: vm.localization.translate(
                                  TextConstants.detailedCatPageTemperament),
                              value: vm.cat.data!.temperament),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: 8,
                          children: [
                            if (vm.cat.data!.adaptability != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants
                                        .detailedCatPageAdaptability),
                                value: vm.cat.data!.adaptability.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (vm.cat.data!.intelligence != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants
                                        .detailedCatPageItelligence),
                                value: vm.cat.data!.intelligence.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (vm.cat.data!.affectionLevel != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants
                                        .detailedCatPageAffectionLevel),
                                value: vm.cat.data!.affectionLevel.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (vm.cat.data!.childFriendly != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants
                                        .detailedCatPageChildFriendly),
                                value: vm.cat.data!.childFriendly.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (vm.cat.data!.lifeSpan != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants.detailedCatPageLifeSpan),
                                value: vm.cat.data!.lifeSpan!,
                                icon: Icons.catching_pokemon,
                              ),
                            if (vm.cat.data!.weight != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants.detailedCatPageWeight),
                                value: vm.cat.data!.weight!,
                                icon: Icons.catching_pokemon,
                              ),
                            if (vm.cat.data!.countryCode != null)
                              CatFeatureItemWidget(
                                title: vm.localization.translate(
                                    TextConstants
                                        .detailedCatPageCountryCode),
                                value: vm.cat.data!.countryCode!,
                                icon: Icons.catching_pokemon,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
         
      ),
    );
  }
}