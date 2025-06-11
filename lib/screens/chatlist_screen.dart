import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../view_models/chatlist_view_model.dart';
import '../models/chat_model.dart';
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
    return Scaffold(
      backgroundColor: sageGreen,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: deepForestGreen),
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

      body: StreamBuilder<List<Chat>>(
        stream: _vm.getChatsForCurrentUser(),
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

          final me = _vm.currentUserEmail;

          return ListView.separated(
            itemCount: chats.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final chat = chats[i];
              final other = chat.users.firstWhere(
                    (e) => e != me,
                orElse: () => 'Unknown',
              );

              return ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundColor: deepForestGreen,
                  child: Text(
                    other[0].toUpperCase(),
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
                  _formatTime(chat.timestamp),
                  style: subtitleTextStyle,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        chatId: chat.id,
                        otherUserEmail: other,
                        currentUserEmail: me,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: deepForestGreen,
        unselectedItemColor: warmBeige,
        onTap: (index) {
          // فقط خيار "Chats" يعمل
          if (index == 0) {
            setState(() => _currentIndex = index);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
        ],
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
