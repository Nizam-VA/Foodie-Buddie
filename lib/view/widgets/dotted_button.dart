import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';

class DottedButtonWidget extends StatelessWidget {
  const DottedButtonWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.icon,
  });

  final double width;
  final double height;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [5, 5],
      color: Colors.green,
      strokeWidth: 1.5,
      child: SizedBox(
        width: width,
        height: height * .13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.green[700]),
            SectionHead(heading: title)
          ],
        ),
      ),
    );
  }
}
