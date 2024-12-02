// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_bloc.dart';

enum genderType { male, female }

class RegistrationState extends Equatable {
  const RegistrationState({
    this.status = FormzStatus.pure,
    this.firstname = const InputText.pure(),
    this.lastname = const InputText.pure(),
    this.phone = const InputText.pure(),
    this.email = const InputText.pure(),
    this.gender = const InputText.pure(),
    this.password = const InputText.pure(),
    this.confirmPassword = const InputText.pure(),
    this.confirmTermsAndCondition = false,
    this.errorMessage,
    this.errors,
    this.selectedCountry,
  });

  final FormzStatus status;
  final InputText firstname;
  final InputText lastname;
  final InputText phone;
  final InputText email;
  final InputText gender;
  final InputText password;
  final bool confirmTermsAndCondition;

  final Ctry? selectedCountry;
  final InputText confirmPassword;
  final String? errorMessage;
  final Map<String, dynamic>? errors;

  RegistrationState copyWith({
    FormzStatus? status,
    InputText? firstname,
    InputText? lastname,
    InputText? phone,
    InputText? email,
    InputText? gender,
    InputText? password,
    bool? confirmTermsAndCondition,
    Ctry? selectedCountry,
    InputText? confirmPassword,
    String? errorMessage,
    Map<String, dynamic>? errors,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      confirmTermsAndCondition:
          confirmTermsAndCondition ?? this.confirmTermsAndCondition,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object?> get props => [
        status,
        firstname,
        lastname,
        phone,
        email,
        password,
        confirmPassword,
        gender,
        selectedCountry,
        confirmTermsAndCondition,
      ];
}
