import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/detailed_cat_page_screen.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/detailed_cat_page_view_model.dart';
import 'package:pragma_test/presentation/ui/utils/stf_view_model_adapter.dart';

class DetailedCatPage extends StatefulWidget {
  static const String route = '/cat/detailed';
  final String id;
  const DetailedCatPage({super.key, required this.id});

  @override
  State<DetailedCatPage> createState() => _DetailedCatPageState();
}

class _DetailedCatPageState extends State<DetailedCatPage> {
  @override
  Widget build(BuildContext context) {
    return StfViewModelAdapter(
      create: () => DetailedCatPageViewModel(
        context: context,
        widget: widget,
        isMounted: () => mounted,
      ),
      builder: (context, viewModel) => DetailedCatPageScreen(),
    );
  }
}
