abstract class LoginEvent {}

class MobileEmailInput extends LoginEvent {
  final String mobileEmail;
  MobileEmailInput({this.mobileEmail});
}

class PasswordInput extends LoginEvent {
  final String password;
  PasswordInput({this.password});
}

class Login extends LoginEvent {
  Function callback;
  Login({this.callback});
}