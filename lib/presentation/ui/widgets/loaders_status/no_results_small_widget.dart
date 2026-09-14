import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pragma_test/domain/states/localization_state.dart';
import 'package:pragma_test/presentation/constants/image_constants.dart';
import 'package:pragma_test/presentation/constants/text_constants.dart';
import 'package:pragma_test/presentation/ui/widgets/buttons/button_widget.dart';
import 'package:provider/provider.dart';

class NoResultsSmallWidget extends StatelessWidget {
  final Function()? onRetry;
  final String? message;
  final String? retryText;
  final String? title;
  final Widget? icon;

  const NoResultsSmallWidget({
    super.key,
    this.onRetry,
    this.message,
    this.retryText,
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final i18n = Provider.of<LocalizationState>(context).translate;
    return ClipRect(
      child: OverflowBox(
        minHeight: 0,
        maxHeight: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ??
                  SvgPicture.asset(
                    ImageConstants.noResultSvg,
                    fit: BoxFit.contain,
                  ),
              const SizedBox(height: 6),
              Text(
                title ?? i18n(TextConstants.noResultsWidgetTitle),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (message != null && message!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  message!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (onRetry != null) ...[
                const SizedBox(height: 8),
                ButtonWidget(
                  fitContent: true,
                  onTap: onRetry!,
                  text:
                      retryText ??
                      i18n(TextConstants.noResultsWidgetButton),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
