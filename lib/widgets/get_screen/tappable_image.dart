import 'dart:io';
import 'package:flutter/material.dart';

class TappableImage extends StatelessWidget {
  final File imageFile;
  final double height;
  final double width;
  final BorderRadius borderRadius;

  const TappableImage({
    Key? key,
    required this.imageFile,
    this.height = 150,
    this.width = 150,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Image Preview')),
              body: Center(
                child: Image.file(
                  imageFile,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.file(
          imageFile,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}