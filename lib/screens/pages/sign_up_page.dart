import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUpPage> {
  String tokenInput = "";
  bool buttonPressed = false;
  bool invalidToken = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _bottomSheet(),
            ],
          ),
        ],
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(left:20.0, right: 20.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.arrow_back, color: Colors.black),
            _signInButton(),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Column(
        children: <Widget>[
          _firstNameTextField(),
          _lastNameTextField(),
          _emailTextField(),
          _passwordTextField(),
          _confirmPasswordTextField(),
          _addressLine1TextField(),
          _addressLine2TextField(),
          _pinCodeTextField(),
          _bankAccountNoTextField(),
          _IFSCCodeTextField(),
        ],
      ),
    );
  }

  _firstNameTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.left,
      onChanged: (val) {
        setState(() {
          tokenInput = val.toUpperCase();
          invalidToken = false;
        });
      },
      style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5),
      decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          errorText: invalidToken ? '' : null,
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
          errorStyle: TextStyle(color: Colors.black54),
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 15,
          ),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
          labelText: 'First name',
          hintText: 'First name'),
    );
  }

  _emailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Email',
            hintText: 'Email'),
      ),
    );
  }

  _lastNameTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Last name',
            hintText: 'Last name'),
      ),
    );
  }

  _passwordTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Password',
            hintText: 'Password'),
      ),
    );
  }

  _confirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Confirm password',
            hintText: 'Confirm password'),
      ),
    );
  }

  _addressLine1TextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Address line 1',
            hintText: 'Address line 1'),
      ),
    );
  }

  _addressLine2TextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Address line 2',
            hintText: 'Address line 2'),
      ),
    );
  }

  _pinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Pincode',
            hintText: 'Pincode'),
      ),
    );
  }

  _bankAccountNoTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'Bank account no.',
            hintText: 'Bank account no.'),
      ),
    );
  }

  _IFSCCodeTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        onChanged: (val) {
          setState(() {
            tokenInput = val.toUpperCase();
            invalidToken = false;
          });
        },
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            errorText: invalidToken ? '🤔 Invalid token' : null,
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
            errorStyle: TextStyle(color: Colors.black54),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            labelText: 'IFSC code',
            hintText: 'IFSC code'),
      ),
    );
  }

  _signInButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(
            width: 150,
            height: 36,
            child: RaisedButton(
              color: Colors.deepOrangeAccent,
              onPressed: () {
                setState(() {
                  buttonPressed = true;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 1,
              child: buttonChild(),
            ))
      ]);

  }

  Widget buttonChild() {
    return buttonPressed
        ? CupertinoActivityIndicator()
        : Text(
            "SIGN IN",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500),
          );
  }
}
