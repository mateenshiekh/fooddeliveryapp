import 'package:azgrills/config/colors.dart';
import 'package:azgrills/screens/ForgotPasswordScreen.dart';
import 'package:azgrills/screens/HomeScreen.dart';
import 'package:azgrills/services/firbase_auth_service.dart';
import 'package:azgrills/widgets/background_widget.dart';
import 'package:azgrills/widgets/custom_Rect_Button.dart';
import 'package:azgrills/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSignIn = true;
  bool _isLoading = false;
  RegExp emailRegex = new RegExp(
      r"^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])");

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, myService, child) {
        return BackgroundWidget(
          child: Scaffold(
            key: _scaffoldState,
            backgroundColor: Colors.transparent,
            body: AbsorbPointer(
              absorbing: _isLoading,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                            minWidth: constraints.maxWidth),
                        child: IntrinsicHeight(
                            child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(child: Container()),
                            Container(
                              child: Text(
                                !_isSignIn ? "Create Account" : "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: primaryColor),
                              ),
                            ),
                            Expanded(child: Container()),
                            !_isSignIn
                                ? Column(
                                    children: <Widget>[
                                      OwnTextFieldWidget(
                                        controller: _nameController,
                                        hintValue: "Full Name",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )
                                : Container(),
                            OwnTextFieldWidget(
                              controller: _emailController,
                              hintValue: "Email",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.email, color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            OwnTextFieldWidget(
                              controller: _passwordController,
                              obscureText: true,
                              hintValue: "Password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.lock_outline,
                                    color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _isLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : RoundedCustomButton(
                                    iconBack: true,
                                    lable: !_isSignIn
                                        ? "CREATE ACCOUNT"
                                        : "SIGN IN",
                                    buttonColor: Colors.red,
                                    textColor: Colors.white,
                                    onTap: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      if (!await validate()) {
                                        return;
                                      }

                                      try {
                                        User usr;
                                        if (!_isSignIn) {
                                          usr = await myService.signUp(
                                              _emailController.text.trim(),
                                              _passwordController.text.trim(),
                                              _nameController.text.trim());
                                          if (usr != null && usr.uid != null) {
                                            _isSignIn = true;
                                            _isLoading = false;
                                            _nameController.text = "";
                                            _emailController.text = "";
                                            _passwordController.text = "";
                                            setState(() {});
                                            return;
                                          }
                                        } else {
                                          usr = await myService.signIn(
                                              _emailController.text.trim(),
                                              _passwordController.text.trim());
                                        }

                                        print(usr.displayName);
                                        print(usr.email);
                                        print(usr.uid);

                                        setState(() {
                                          _isLoading = false;
                                        });

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()),
                                                (route) => false);
                                      } catch (e) {
                                        print(e);
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        showSnackbar(e.toString());
                                      }
                                    },
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  minRadius: 25,
                                  maxRadius: 25,
                                  backgroundImage:
                                      AssetImage('assets/Group 15.png'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  minRadius: 25,
                                  maxRadius: 25,
                                  backgroundImage:
                                      AssetImage('assets/Group 16.png'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _isSignIn ? FlatButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                )) : Container(),
                            SizedBox(
                              height: 10,
                            ),
                            FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _nameController.text = "";
                                    _emailController.text = "";
                                    _passwordController.text = "";
                                    _isSignIn = !_isSignIn;
                                  });
                                },
                                child: Text(
                                  !_isSignIn ? "SIGN IN" : "REGISTER",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                )),
                            Expanded(child: Container()),
                          ],
                        ))),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }

  void showSnackbar(String message) {
    _scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: new Text(message),
        duration: new Duration(seconds: 3),
      ),
    );
  }

  Future<bool> validate() async {
    if (!_isSignIn && _nameController.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      showSnackbar("Please Enter Your Full Name");
      return false;
    }

    if (_emailController.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      showSnackbar("Please Enter Your Email");
      return false;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      showSnackbar("Please Enter Your Password");
      return false;
    }

    if (!emailRegex.hasMatch(_emailController.text)) {
      setState(() {
        _isLoading = false;
      });
      showSnackbar("Please Enter a Valid Email Address");
      return false;
    }

    return true;
  }
}
