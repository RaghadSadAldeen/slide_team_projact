String? validateEmail(String? value) {
  final trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return 'Please enter your email';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(trimmedValue)) {
    return 'Please enter a valid email address';
  }

  final localPart = trimmedValue.split('@').first;
  if (!RegExp(r'[a-zA-Z]').hasMatch(localPart)) {
    return 'Email must include at least one letter before @';
  }

  return null;
}

String? validatePassword(String? value) {
  final password = value?.trim() ?? '';

  if (password.isEmpty) {
    return 'Please enter your password';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
  final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
  final hasDigit = RegExp(r'[0-9]').hasMatch(password);
  final hasSpecialChar = RegExp(r'[!@#\$&*~%^()\-_=+{};:,<.>?]').hasMatch(password);

  int strengthScore = 0;
  if (hasUppercase) strengthScore++;
  if (hasLowercase) strengthScore++;
  if (hasDigit) strengthScore++;
  if (hasSpecialChar) strengthScore++;
  if (strengthScore < 3) {
    return 'Password is too weak. Try adding letters, numbers, and symbols.';
  } else if (strengthScore == 3) {
    return 'Password is medium. Please use a stronger password.';
  } else {
    return null;
  }
}
