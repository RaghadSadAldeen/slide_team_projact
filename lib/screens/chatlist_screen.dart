import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/chat_model.dart';
import '../view_models/add_slide_view_model.dart';
import '../view_models/chatlist_view_model.dart';
import '../view_models/user_provider.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _vm = ChatListViewModel();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddSlideViewModel>(context);
    final userProfile = Provider.of<UserProvider>(context).userProfile;
    return Scaffold(
      backgroundColor: sageGreen,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: deepForestGreen),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: deepForestGreen),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  userProfile: userProfile,
                  chatId: 'default_chat_id',
                ),
              ),
            );
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/slide.png', height: 30),
            const SizedBox(width: 8),
            const Text(
              'Chat List',
              style: TextStyle(
                color: deepForestGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: StreamBuilder<List<ChatSummary>>(
        stream: _vm.getChats(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: deepForestGreen),
            );
          }

          final chats = snap.data!;
          if (chats.isEmpty) {
            return const Center(
              child: Text('No Found Chats', style: subtitleTextStyle),
            );
          }

          final me = _vm.currentUser?.email ?? '';

          return ListView.separated(
            itemCount: chats.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final chat = chats[i];
              final other = chat.otherUserEmail;

              return ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundColor: deepForestGreen,
                  child: Text(
                    other.isNotEmpty ? other[0].toUpperCase() : '?',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(other, style: bodyTextStyle),
                subtitle: Text(
                  chat.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subtitleTextStyle,
                ),
                trailing: Text(
                  _formatTime(chat.lastMessageTime),
                  style: subtitleTextStyle,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        userProfile: userProfile,
                        chatId: chat.chatId,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatTime(DateTime? t) {
    if (t == null) return '';
    final hour = t.hour.toString().padLeft(2, '0');
    final minute = t.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
