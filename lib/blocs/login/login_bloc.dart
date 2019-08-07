import 'package:module_bloc_event/blocs/login/login_event.dart';
import 'package:module_bloc_event/blocs/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:module_bloc_event/helpers/vars.dart';
import 'package:module_bloc_event/viewmodel/api_provider.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiProvider apiProvider = ApiProvider();

  void mobileEmailInput(mobileEmail) {
    dispatch(MobileEmailInput(mobileEmail: mobileEmail));
  }

  void passwordInput(passwordInput) {
    dispatch(PasswordInput(password: passwordInput));
  }

  void login(callback) {
    dispatch(Login(callback: callback));
  }

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if (event is MobileEmailInput) {
      yield currentState.copyWith(mobile: event.mobileEmail);
    }

    if (event is PasswordInput) {
      yield currentState.copyWith(password: event.password);
    }

    if (event is Login) {
      yield currentState.copyWith(loading: true);

      await apiProvider.getLogin(currentState.mobile, currentState.password);
      try {
        var user = apiProvider.apiResult.response;
        if (apiProvider.apiResult.responseCode == ok200) {
          yield currentState.copyWith(
            loaded: true,
            loading: false,
            error: {},
          );
          event.callback(user);
        } else {
          yield currentState.copyWith(
            loaded: true,
            loading: false,
            error: {
              "error": apiProvider.apiResult.responseCode == 404
                  ? 'Record not found'
                  : 'Enter mobile or password'
            },
          );
          event.callback(false);
        }
      } catch (e) {
        yield currentState.copyWith(
          loaded: true,
          loading: false,
          error: {"error": "Error, Something bad happened."},
        );
      }
    }
  }
}
