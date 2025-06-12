import 'dart:io';
import 'package:flutter/material.dart';
import 'package:slide_team_project/view_models/chat_view_model.dart';
import 'package:slide_team_project/models/message_model.dart';
import 'package:slide_team_project/models/user_profile.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class ChatScreen extends StatefulWidget {
  final UserProfile userProfile;
  final String chatId;

  const ChatScreen({
    Key? key,
    required this.userProfile,
    required this.chatId,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatViewModel _viewModel;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = ChatViewModel(widget.chatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sageGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: widget.userProfile.imagePath.isNotEmpty
                  ? (widget.userProfile.imagePath.startsWith('http')
                  ? NetworkImage(widget.userProfile.imagePath)
                  : FileImage(File(widget.userProfile.imagePath))
              as ImageProvider)
                  : null,
              child: widget.userProfile.imagePath.isEmpty
                  ? const Icon(Icons.person, size: 30, color: whiteColor)
                  : null,
            ),
            const SizedBox(width: 10),
            Text(
              widget.userProfile.name.isNotEmpty
                  ? widget.userProfile.name
                  : 'No Name',
              style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: _viewModel.getMessagesStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final messages = snapshot.data!;
                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[messages.length - 1 - index];
                      final isMe =
                          message.sender == _viewModel.currentUser?.email;
                      return MessageBubble(
                        message: message,
                        isMe: isMe,
                      );
                    },
                  );
                },
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: deepForestGreen, width: 2)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write your message here...',
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _viewModel.sendMessage(_controller.text);
              _controller.clear();
            },
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({required this.message, required this.isMe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(message.sender,
              style: const TextStyle(fontSize: 12, color: Colors.black45)),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
              topRight: isMe ? Radius.zero : const Radius.circular(30),
            ),
            color: isMe ? deepForestGreen : Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message.text,
                style: TextStyle(
                    fontSize: 15, color: isMe ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
