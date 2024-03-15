class AuthValidation {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value.length > 20) {
      return 'Password must be at most 20 characters';
    }
    return null;
  }

  static String? validateNickname(String value) {
    if (value.isEmpty) {
      return 'Please enter your nickname';
    }
    if (value.length < 3) {
      return 'Nickname must be at least 3 characters';
    }
    if (value.length > 16) {
      return 'Nickname must be at most 16 characters';
    }
    return null;
  }
}