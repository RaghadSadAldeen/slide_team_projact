import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/generateChId.dart';
import '../../view_models/user_provider.dart';
import '../../screens/chat_screen.dart';
import '../models/get_slide_model.dart';
import 'common/custom_button.dart';
import 'get_screen/tappable_image.dart';

class GetSlideCard extends StatelessWidget {
  final GetSlideModel slide;
  final String currentUserId;

  const GetSlideCard({
    super.key,
    required this.slide,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final chatId = generateChatId(currentUserId, slide.email);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (slide.imageUrl != null)
            Center(child: Image.network(slide.imageUrl!)),

          const SizedBox(height: 16),
          Text('Name: ${slide.name}', style: const TextStyle(fontSize: 16)),
          const Divider(),
          Text('Email: ${slide.email}', style: const TextStyle(fontSize: 16)),
          const Divider(),
          Text('Title: ${slide.title}', style: const TextStyle(fontSize: 16)),
          const Divider(),
          Text('Description: ${slide.description}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Borrowing slides',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    userProfile: Provider.of<UserProvider>(context, listen: false).userProfile,
                    chatId: chatId,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
