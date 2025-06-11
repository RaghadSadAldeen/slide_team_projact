class ChatSummary {
  final String chatId;
  final String otherUserEmail;
  final String lastMessage;
  final DateTime lastMessageTime;

  ChatSummary({
    required this.chatId,
    required this.otherUserEmail,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}