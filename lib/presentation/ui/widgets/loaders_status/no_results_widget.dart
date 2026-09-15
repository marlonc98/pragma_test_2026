import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pragma_test/presentation/constants/text_constants.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';
import 'package:pragma_test/presentation/ui/widgets/buttons/button_widget.dart';
import 'package:pragma_test/presentation/ui/widgets/images/splash_loading_lottie_widget.dart';
import 'package:provider/provider.dart';

class NoResultsWidget extends StatelessWidget {
  final Function()? onRetry;
  final String? message;
  final String? retryText;
  final String? title;
  final Widget? icon;
  final ButtonType buttonType;
  const NoResultsWidget(
      {super.key,
      this.onRetry,
      this.message,
      this.retryText,
      this.title,
      this.icon,
      this.buttonType = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    final i18n = Provider.of<LocalizationStateImpl>(context).translate;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SplashLoadingLottieWidget(),
            const SizedBox(height: 20),
            if (title != null && title!.isNotEmpty) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
            ],
            SizedBox(
              width: 320,
              child: Text(
                (message != null && message!.isNotEmpty)
                    ? message!
                    : i18n(TextConstants.noResultsWidgetDescription),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ),
            const SizedBox(height: 20),
            if (onRetry != null)
              Container(
                alignment: Alignment.center,
                child: ButtonWidget(
                    fitContent: true,
                    type: buttonType,
                    onTap: onRetry!,
                    text: retryText ??
                        i18n(TextConstants.noResultsWidgetButton)),
              ),
          ],
        ),
      ),
    );
  }
}
