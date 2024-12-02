String? validation(List<InputValidator> validators) {
  String? erroMessage;
  for (var validator in validators) {
    if (validator.isValid == false) {
      erroMessage = validator.errorMessage;
      break;
    }
  }

  return erroMessage;
}

class InputValidator {
  final bool isValid;
  final String errorMessage;

  const InputValidator({
    required this.isValid,
    required this.errorMessage,
  });
}
