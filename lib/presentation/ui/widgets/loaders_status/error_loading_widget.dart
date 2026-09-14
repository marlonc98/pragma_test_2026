import 'package:flutter/material.dart';
import 'package:pragma_test/domain/states/localization_state.dart';
import 'package:pragma_test/presentation/constants/text_constants.dart';
import 'package:pragma_test/presentation/ui/widgets/buttons/button_widget.dart';
import 'package:provider/provider.dart';

class ErrorLoadingWidget extends StatelessWidget {
  final Function()? onRetry;
  final String? error;

  const ErrorLoadingWidget({super.key, required this.onRetry, this.error});

  @override
  Widget build(BuildContext context) {
    final i18n = Provider.of<LocalizationState>(context).translate;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              error ?? i18n(TextConstants.errorLoadingWidgetAnErrorOccurred),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 32),
            if (onRetry != null) SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ButtonWidget(
                onTap: onRetry!,
                text: i18n(TextConstants.retry),
              ),
            )
          ],
        ),
      ),
    );
  }
}
