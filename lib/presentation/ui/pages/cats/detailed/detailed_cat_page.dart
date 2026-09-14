import 'package:flutter/material.dart';

class DetailedCatPage extends StatefulWidget {
  static const String route = '/cat/detailed';
  final String id;
  const DetailedCatPage({super.key, required this.id});

  @override
  State<DetailedCatPage> createState() => _DetailedCatPageState();
}

class _DetailedCatPageState extends State<DetailedCatPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}