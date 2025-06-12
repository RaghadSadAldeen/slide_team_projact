String generateChatId(String userId1, String userId2) {
  return userId1.hashCode <= userId2.hashCode
      ? '${userId1}_$userId2'
      : '${userId2}_$userId1';
}
