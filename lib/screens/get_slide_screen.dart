import 'dart:io';
import 'package:flutter/material.dart';
import 'package:slide_team_project/constants/colors.dart';
import '../constants/text_styles.dart';
import '../screens/chat_screen.dart';
import '../widgets/get_screen/tappable_image.dart';

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

  Widget buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Slide', style: sectionTitleStyle.copyWith(color: deepForestGreen)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (imageFile != null)
                  Center(child: TappableImage(imageFile: imageFile!)),

                const SizedBox(height: 16),
                buildInfoRow(context, 'Name:', name),
                const Divider(height: 20, thickness: 1),
                buildInfoRow(context, 'Email:', email),
                const Divider(height: 20, thickness: 1),
                buildInfoRow(context, 'Slide Title:', slideTitle),
                const Divider(height: 20, thickness: 1),
                buildInfoRow(context, 'Description:', description),
                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },

                  icon: const Icon(Icons.add),
                  label: const Text('Borrowing slides'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: deepForestGreen,
                    foregroundColor: whiteColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
