String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  }

  final emailRegEx = RegExp(
    r"^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  if (!emailRegEx.hasMatch(email)) {
    return 'Enter a valid email address';
  }

  return null;
}
