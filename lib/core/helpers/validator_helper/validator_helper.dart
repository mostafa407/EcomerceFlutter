bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  return emailRegExp.hasMatch(email);
}

bool isValidPassword(String password) {
  final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  return passwordRegExp.hasMatch(password);
}