import 'package:meta/meta.dart';
import '../common_state.dart';

class LoginState extends CommonState {
  final String mobile;
  final String password;
  bool loading;
  bool loaded;
  Map error;

  LoginState({
    @required this.mobile,
    @required this.password,
    bool loading,
    bool loaded,
    Map error,
  }) : super(
    loading: loading,
    loaded: loaded,
    error: error,
  );

  factory LoginState.initial() {
    return LoginState(
      mobile: "",
      password: "",
    );
  }

  LoginState copyWith(
      {bool loading,
        bool loaded,
        Map error,
        String mobile,
        String uid,
        String password}) {
    return LoginState(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }
}

