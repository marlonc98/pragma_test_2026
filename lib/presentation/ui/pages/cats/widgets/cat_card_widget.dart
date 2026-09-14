import 'package:flutter/material.dart';
import 'package:pragma_test/domain/entities/cat_entity.dart';
import 'package:pragma_test/presentation/ui/widgets/images/image_network_with_load_widget.dart';

class CatCardWidget extends StatelessWidget {
  final CatEntity cat;
  final Function()? onTap;
  const CatCardWidget({super.key, required this.cat, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            ImageNetworkWithLoadWidget(
              cat.image,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary
                          .withValues(alpha: 0.8),
                      Theme.of(context).colorScheme.primary
                          .withValues(alpha: 0.1),
                    ],
                    begin: const Alignment(0, 0.8),
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cat.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor,
                              ),
                            ),
                            cat.origin != null
                                ? Text(
                                    cat.origin!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      cat.oneCharacteristic != null
                          ? Text(
                              cat.oneCharacteristic!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
