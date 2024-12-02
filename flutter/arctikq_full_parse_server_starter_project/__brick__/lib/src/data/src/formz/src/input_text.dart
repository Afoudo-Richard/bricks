import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

enum InputTextValidationError { empty }

class InputText extends FormzInput<String, String> {
  const InputText.pure({
    this.validators,
    this.shouldUseValidation = true,
  }) : super.pure('');

  const InputText.dirty([
    String value = '',
    this.validators,
    this.shouldUseValidation = true,
  ]) : super.dirty(value);

  final List<InputValidator>? validators;
  final bool shouldUseValidation;

  @override
  String? validator(String? value) {
    if (shouldUseValidation) {
      if (value != null) {
        List<InputValidator> validators = [
          InputValidator(
            isValid: value.isNotEmpty,
            errorMessage: "Please enter a text",
          ),
          if (this.validators != null) ...this.validators!,
          // for (var inputValidator in this.validators!) inputValidator(value),
        ];

        return validation(validators);
      }
    } else {}

    return null;
  }

  InputValidator validatorBuilder(String value) {
    return InputValidator(
      isValid: value.isNotEmpty,
      errorMessage: "Please enter a text",
    );
  }
}

typedef ValidatorBuilder = InputValidator Function(String value);
