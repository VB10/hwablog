void emailValidator() {}

class ValidatorHelper {
  static String _emailRegex =
      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-3-.]+$";
  static String passwordValidator(String value) {
    // Firebase password need minumum 6 length .
    if (value.isEmpty) {
      return "Please enter password.";
    } else if (value.length < 6)
      return "Please password lenght 6+";
    else {
      return null;
    }
  }

  static String emailValidator(String value) {
    RegExp _regExp = new RegExp(_emailRegex);
    // Firebase password need minumum 6 length .
    if (value.isEmpty) {
      return "Please don't leave email field.";
    } else if (!_regExp.hasMatch(value))
      return "Please enter correct email adress.";
    else {
      return null;
    }
  }
}
