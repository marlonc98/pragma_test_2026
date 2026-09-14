import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/utils/view_model.dart';
import 'package:provider/provider.dart';

class StfViewModelAdapter<T extends ViewModel> extends StatefulWidget {
  final T Function() create;
  final Widget Function(BuildContext context, T viewModel) builder;

  const StfViewModelAdapter({
    super.key,
    required this.create,
    required this.builder,
  });

  @override
  State<StfViewModelAdapter<T>> createState() =>
      _StfViewModelAdapterState<T>();
}

class _StfViewModelAdapterState<T extends ViewModel>
    extends State<StfViewModelAdapter<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.create(),
      child: Consumer<T>(
        builder: (context, viewModel, child) =>
            widget.builder(context, viewModel),
      ),
    );
  }
}