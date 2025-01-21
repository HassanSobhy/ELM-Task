class ValidateEmailUseCase {
  EmailValidatorState call(String email) {
    if (email.isEmpty) {
      return EmailValidatorState.EmptyEmail;
    } else if (!_isEmailValid(email)) {
      return EmailValidatorState.InvalidEmail;
    } else {
      return EmailValidatorState.ValidEmail;
    }
  }

  bool _isEmailValid(String email) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    var regExp = RegExp(pattern);

    return regExp.hasMatch(email.trim());
  }
}

enum EmailValidatorState {
  EmptyEmail,
  InvalidEmail,
  ValidEmail,
}
