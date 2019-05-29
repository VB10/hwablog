void emailValidator() {}

class ValidatorHelper {
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
}
