import 'package:flutter/material.dart';

class CatFeatureItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  const CatFeatureItemWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28 > 120
          ? 120
          : MediaQuery.of(context).size.width * 0.28,
      height: 46,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 5),
              Text(value),
            ],
          ),
          Text(title, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
