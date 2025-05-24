import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class ShowMaterialCard extends StatelessWidget {
  final String title;
  const ShowMaterialCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: sageGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: bodyTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
