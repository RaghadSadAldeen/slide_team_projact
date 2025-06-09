import 'dart:io';
import 'package:flutter/material.dart';

class GetSlideScreen extends StatelessWidget {
  final String name;
  final String email;
  final String slideTitle;
  final String description;
  final File? imageFile;

  const GetSlideScreen({
    super.key,
    required this.name,
    required this.email,
    required this.slideTitle,
    required this.description,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageFile != null)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(imageFile!, height: 150, width: 150, fit: BoxFit.cover),
                  ),
                )
              else
                const SizedBox(height: 150),

              const SizedBox(height: 16),


              Text('Name:', style: Theme.of(context).textTheme.titleMedium),
              Text(name, style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 12),

              Text('Email:', style: Theme.of(context).textTheme.titleMedium),
              Text(email, style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 12),

              Text('Slide Title:', style: Theme.of(context).textTheme.titleMedium),
              Text(slideTitle, style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 12),

              Text('Description:', style: Theme.of(context).textTheme.titleMedium),
              Text(description, style: const TextStyle(fontSize: 18)),

            ],
          ),
        ),
      ),
    );
  }
}
