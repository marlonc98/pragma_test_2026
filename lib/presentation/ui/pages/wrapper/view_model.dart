import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';
import 'package:provider/provider.dart';

class ViewModel<T> with ChangeNotifier {
  T widget;
  BuildContext context;
  GetIt getIt = GetIt.instance;
  late LocalizationStateImpl localization;
  bool Function() isMounted;
  bool _isDisposed = false;
  bool get mounted => isMounted();

  ViewModel(
      {required this.context, required this.widget, bool Function()? isMounted})
      : isMounted = isMounted ?? (() => true) {
    localization = Provider.of<LocalizationStateImpl>(context);
  }

  @override
  notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
