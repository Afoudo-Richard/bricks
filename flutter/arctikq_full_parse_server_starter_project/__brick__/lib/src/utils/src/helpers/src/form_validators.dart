import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:validators/validators.dart';

List<InputValidator> listOfPhoneNumberValidators(String value) {
  return [
    InputValidator(
      isValid: isNumeric(value),
      errorMessage: "Enter a number",
    ),
    InputValidator(
      isValid: isLength(value, 9, 20),
      // errorMessage: "Le téléphone doit comporter 9 caractères.",
      errorMessage: "Phone number must be exactly 9 characters",
    ),
  ];
}

List<InputValidator> listOfNumberValidators(String value) {
  return [
    InputValidator(
      isValid: isNumeric(value),
      errorMessage: "Enter a number",
    ),
  ];
}
