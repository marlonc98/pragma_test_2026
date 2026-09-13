import 'package:flutter/cupertino.dart';

class CatsPage extends StatefulWidget {
  static const String route = "/cats";
  const new({super.key});

  @override
  State<CatsPage> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}