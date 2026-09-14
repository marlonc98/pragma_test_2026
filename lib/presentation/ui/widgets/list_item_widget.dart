import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String? title, value;
  const ListItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
        ),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
            padding: const EdgeInsets.only(right: 8, bottom: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(title!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                if (title != null && value != null) const SizedBox(height: 2),
                if (value != null)
                  Text(
                    value ?? "",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  )
              ],
            )));
  }
}
