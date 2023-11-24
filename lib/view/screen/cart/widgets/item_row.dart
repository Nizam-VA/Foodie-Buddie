import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.keyString, required this.value});

  final String keyString;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [SectionHead(heading: keyString), SectionHead(heading: value)],
    );
  }
}
