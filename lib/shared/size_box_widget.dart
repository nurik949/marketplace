import 'package:flutter/material.dart';

class SizesBoxWidget extends StatelessWidget {
  final double height;

  const SizesBoxWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height));
  }
}