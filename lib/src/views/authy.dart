import 'package:blogapp/src/helpers/colors.dart';
import 'package:blogapp/src/helpers/fonts.dart';
import 'package:blogapp/src/helpers/responsive.dart';
import 'package:blogapp/src/views/home.dart';
import 'package:blogapp/src/views/welcome.dart';
import 'package:blogapp/src/widgets/have.dart';
import 'package:flutter/material.dart';

class AuthyScreen extends StatefulWidget {
  @override
  _AuthyScreenState createState() => _AuthyScreenState();
}

enum FormMode { LOGIN, SIGNUP }

class _AuthyScreenState extends State<AuthyScreen> {
  TextStyle style = TextStyle(fontFamily: afont, fontSize: 20.0, color: Colors.black);
  TextEditingController _email;
  TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  String _errorMessage = "";
  String _cname;
  String _cphone;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Center(
                child: (_formMode == FormMode.LOGIN)
                    ? Column(
                        children: [
                          Text(
                            'Welcome back!',
                            style: style.copyWith(
                              fontSize: SizeConfig.textSize(context, 7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: SizeConfig.yMargin(context,3)),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: SizeConfig.yMargin(context, 6)),
                          Text(
                            'Welcome!',
                            style: style.copyWith(
                              fontSize: SizeConfig.textSize(context, 6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: SizeConfig.yMargin(context, 3)),
                        ],
                      )),
            formWidget(),
              SizedBox(height: SizeConfig.yMargin(context, 2)),
            loginandSignupButton(),
            errorWidget(),
              SizedBox(height: SizeConfig.yMargin(context, 3.5)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                color: blueblack,
                thickness: 2,
              ),
            ),
              SizedBox(height: SizeConfig.yMargin(context, 2)),
            (_formMode == FormMode.LOGIN)
                ? DoYouHave(
                    style: style,
                    ftext: 'Dont have an account? ',
                    stext: 'Create Account',
                    press: showSignupForm)
                : DoYouHave(
                    style: style,
                    ftext: 'Already have an account? ',
                    stext: 'Login',
                    press: showLoginForm,
                  )
          ],
        ),
      ),
    );
  }

  Widget loginandSignupButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: orange,
      child: MaterialButton(
        onPressed: () {
          _valiidateandSubmit();
        },
        child: _formMode == FormMode.LOGIN
            ? Text(
                "Login",
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            : Text(
                "Create Account",
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _valiidateandSubmit() async {
    if (_validateAndSave()) {
      print(_cname);
      print(_email.text);
       Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }

  Widget formWidget() {
    if (_formMode == FormMode.LOGIN) {
      return Form(
          key: _formKey,
          child: Column(children: <Widget>[
            emailField(),
            SizedBox(height: 10.0),
            passwordField(),
            SizedBox(height: 24.0),
          ]));
    } else {
      return Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 10.0),
            nameWidget(),
            SizedBox(height: 10.0),
            snameWidget(),
            SizedBox(height: 10.0),
            emailField(),
            SizedBox(height: 10.0),
            passwordField(),
            SizedBox(height: 24.0),
          ]));
    }
  }

  Widget nameWidget() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "First Name",
          contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      validator: (value) => value.isEmpty ? 'Name can not be empty' : null,
      onSaved: (value) => _cname = value.trim(),
    );
  }

  Widget snameWidget() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Seconf Name",
          contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      validator: (value) => value.isEmpty ? 'Field can not be empty' : null,
      onSaved: (value) => _cphone = value.trim(),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
        controller: _password,
        autofocus: false,
        validator: (value) {
          if (value.isEmpty) {
            return 'Password cannot be empty';
          }
          if (value.length < 8) {
            return 'Password must be longer than 8 characters';
          } else {
            return null;
          }
        },
        style: style,
        decoration: InputDecoration(
            prefixIcon: _formMode == FormMode.LOGIN ? Icon(Icons.lock) : null,
            labelText: 'Password*',
            hintText: "********",
            contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }

  TextFormField emailField() {
    return TextFormField(
        controller: _email,
        validator: (value) {
          if (value.isEmpty) {
            return 'Email cannot be empty';
          }
          {
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return 'Email format is invalid';
            } else {
              return null;
            }
          }
        },
        style: style,
        decoration: InputDecoration(
            prefixIcon: _formMode == FormMode.LOGIN ? Icon(Icons.email) : null,
            labelText: "Email",
            contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }

  void showSignupForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void showLoginForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  errorWidget() {
    double width = MediaQuery.of(context).size.width;
    if (_errorMessage.length > 0 && _errorMessage != null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Container(
            height: SizeConfig.yMargin(context, 15),
            width: SizeConfig.xMargin(context, width),
            child: Text(_errorMessage)),
      ));
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }
}
