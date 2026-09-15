import 'package:flutter/cupertino.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cats_page_screen.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cats_page_view_model.dart';
import 'package:pragma_test/presentation/ui/utils/stf_view_model_adapter.dart';

class CatsPage extends StatefulWidget {
  static const String route = "/cats";
  const CatsPage({super.key});

  @override
  State<CatsPage> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  @override
  Widget build(BuildContext context) {
    return StfViewModelAdapter(
      create: () => CatsPageViewModel(
        context: context,
        widget: widget,
        isMounted: () => mounted,
      ),
      builder: (context, viewModel) => CatsPageScreen(),
    );
  }
}