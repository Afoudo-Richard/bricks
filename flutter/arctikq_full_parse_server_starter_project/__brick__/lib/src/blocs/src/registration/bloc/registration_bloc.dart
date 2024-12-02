import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:validators/validators.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    required this.authenticationBloc,
  }) : super(const RegistrationState(gender: InputText.dirty("male"))) {
    on<RegistrationFirstNameChanged>(_onFirstNameChanged);
    on<RegistrationLastNameChanged>(_onLastNameChanged);
    on<RegistrationPhoneChanged>(_onPhoneChanged);
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationGenderChanged>(_onRegistrationGenderChanged);
    on<RegistrationSelectCountryChanged>(_onRegistrationSelectCountryChanged);
    // on<RegistrationConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegistrationConfirmTermsAndConditionsChanged>(
        _onRegistrationConfirmTermsAndConditionsChanged);
    on<SubmitInputsChecked>(_onSubmitInputsChecked);
    on<RegistrationSubmitted>(_onSubmitted);
  }

  final AuthenticationBloc authenticationBloc;

  void _onRegistrationSelectCountryChanged(
    RegistrationSelectCountryChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(
      selectedCountry: event.country,
    ));
  }

  void _onRegistrationConfirmTermsAndConditionsChanged(
    RegistrationConfirmTermsAndConditionsChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(confirmTermsAndCondition: event.value));
  }

  void _onFirstNameChanged(
    RegistrationFirstNameChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final firstname = InputText.dirty(event.firstname);
    emit(state.copyWith(
      firstname: firstname,
      status: Formz.validate([
        firstname,
        state.lastname,
        state.phone,
        state.email,
        state.password,
        // state.confirmPassword,
      ]),
    ));
  }

  void _onLastNameChanged(
    RegistrationLastNameChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final lastname = InputText.dirty(event.lastname);
    emit(state.copyWith(
      lastname: lastname,
      status: Formz.validate([
        state.firstname,
        lastname,
        state.phone,
        state.email,
        state.password,
        // state.confirmPassword,
      ]),
    ));
  }

  void _onPhoneChanged(
    RegistrationPhoneChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final phone =
        InputText.dirty(event.phone, listOfPhoneNumberValidators(event.phone));
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([
        state.firstname,
        state.lastname,
        phone,
        state.email,
        state.password,
        // state.confirmPassword,
      ]),
    ));
  }

  void _onEmailChanged(
    RegistrationEmailChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final email = InputText.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.firstname,
        state.lastname,
        state.phone,
        email,
        state.password,
        // state.confirmPassword,
      ]),
    ));
  }

  void _onPasswordChanged(
    RegistrationPasswordChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final password = InputText.dirty(event.password, [
      InputValidator(
        isValid: matches(event.password,
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$"),
        errorMessage:
            "The password must be contain uppercase, lowercase and numeric",
      ),
    ]);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.firstname,
        state.lastname,
        state.phone,
        state.email,
        password,
        // state.confirmPassword,
      ]),
    ));
  }

  // void _onConfirmPasswordChanged(
  //   RegistrationConfirmPasswordChanged event,
  //   Emitter<RegistrationState> emit,
  // ) {
  //   final confirmPassword = InputText.dirty(event.confirmPassword, [
  //     InputValidator(
  //       isValid: equals(event.confirmPassword, state.password.value),
  //       errorMessage: "Confirm passworm must be thesame as password",
  //     ),
  //   ]);
  //   emit(state.copyWith(
  //     confirmPassword: confirmPassword,
  //     status: Formz.validate([
  //       state.firstname,
  //       state.lastname,
  //       state.phone,
  //       state.email,
  //       state.password,
  //       confirmPassword,
  //     ]),
  //   ));
  // }

  void _onSubmitInputsChecked(
    SubmitInputsChecked event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(
      firstname: InputText.dirty(state.firstname.value),
      lastname: InputText.dirty(state.lastname.value),
      phone: InputText.dirty(state.phone.value),
      email: InputText.dirty(state.email.value),
      password: InputText.dirty(state.password.value),
      // confirmPassword: InputText.dirty(state.confirmPassword.value, [
      //   InputValidator(
      //     isValid: equals(state.confirmPassword.value, state.password.value),
      //     errorMessage: "Confirm passworm must be thesame as password",
      //   ),
      // ]),
    ));
  }

  void _onRegistrationGenderChanged(
    RegistrationGenderChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final gender = InputText.dirty(event.gender);
    emit(state.copyWith(
      gender: gender,
      status: Formz.validate([
        gender,
        state.firstname,
        state.lastname,
        state.phone,
        state.email,
        state.password,
        // state.confirmPassword,
      ]),
    ));
  }

  void _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final response = await _signUp(
          firstname: state.firstname.value,
          lastname: state.lastname.value,
          email: state.email.value,
          phone: "${state.selectedCountry!.dialCode}${state.phone.value}",
          country: state.selectedCountry!,
          password: state.password.value,
          gender: state.gender.value.capitalizeFirst,
        );

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on ErrorRegistering catch (e) {
        emit(
          state.copyWith(
            errorMessage: e.getErrorsAsString ?? e.message,
            errors: e.errors,
            status: FormzStatus.submissionFailure,
          ),
        );
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  Future _signUp({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required Ctry country,
    required String gender,
    required String password,
  }) async {
    final user = User(username: phone, password: password, email: email);
    user
      ..phone = phone
      ..gender = gender
      ..firstname = firstname
      ..lastname = lastname
      ..ctry = country
      ..devices = [];

    var response = await user.signUp();

    if (response.success) {
      var result = response.result;
      return true;
    } else {
      debugPrint(response.error?.message);
      throw ErrorRegistering(
        message: response.error?.message ==
                'Account already exists for this username.'
            ? 'Account already exists for this phone.'
            : response.error?.message,
      );
    }
  }
}
