import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/login/login_bloc.dart';
import 'package:module_bloc_event/blocs/login/login_state.dart';
import 'package:module_bloc_event/blocs/user/user_bloc.dart';
import 'package:module_bloc_event/helpers/vars.dart';
import 'package:module_bloc_event/models/login.dart';
import 'package:module_bloc_event/screens/widgets/fetch_ui.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc;
  UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 57.0),
                  child: Text('Flutter',
                      style: TextStyle(
                          fontFamily: quickFont,
                          color: Colors.black45,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              _bottomSheet(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.grey.withAlpha(11),
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height / 1.4,
      child: Column(
        children: <Widget>[
          Text('LOGIN',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: quickFont,
                  color: Colors.black38.withOpacity(0.4),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          _mobileEmailTextField(),
          _passwordTextField(),
          _signInButton(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: quickFont,
                      color: Colors.grey, fontSize: 14, letterSpacing: 0),
                ),
                Text(
                  "Sign up Now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: quickFont,
                      color: Colors.black87, fontSize: 14, letterSpacing: 0.5),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _mobileEmailTextField() => BlocBuilder(
        bloc: loginBloc,
        builder: (BuildContext context, LoginState state) {
          return Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              onChanged: loginBloc.mobileEmailInput,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'quickFont',
                  fontSize: 18,
                  letterSpacing: 0.5),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red.shade200, width: 2)),
                  errorStyle: TextStyle(color: Colors.black54),
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'quickFont',
                    fontSize: 15,
                  ),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  labelText: 'Mobile / Email',
                  hintText: 'Mobile / Email'),
            ),
          );
        },
      );

  _passwordTextField() => BlocBuilder(
        bloc: loginBloc,
        builder: (BuildContext context, LoginState state) {
          return Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              onChanged: loginBloc.passwordInput,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'quickFont',
                  fontSize: 18,
                  letterSpacing: 0.5),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red.shade200, width: 2)),
                  errorStyle: TextStyle(color: Colors.black54),
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'quickFont',
                    fontSize: 15,
                  ),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  labelText: 'Password',
                  hintText: 'Password'),
            ),
          );
        },
      );

  buttonChild() {
    return Text(
      "SIGN IN",
      style: TextStyle(fontFamily: quickFont,
          color: Colors.white,
          fontSize: 14,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w500),
    );
  }

  void onRegisterDevice() async {
    showProgress(context);
    loginBloc.login((results) {
      hideProgress(context);
      if (results is LoginResponse) {
        LoginResponse loginResponse = results;

        userBloc.saveAuthToken('');
        userBloc.saveUserName(loginResponse.username);
        userBloc.saveId(loginResponse.code);
        userBloc.saveMobile(loginResponse.mobile);

        Navigator.pushNamed(context, '/homepage');

      } else {}
    });
  }

  _signInButton() => BlocBuilder(
      bloc: loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state.error != null && state.error.containsKey('error')) {}
        return new Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 150,
                    height: 36,
                    child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        onRegisterDevice();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 1,
                      child: buttonChild(),
                    ))
              ]),
        );
      });
}
