import 'package:azgrills/config/colors.dart';
import 'package:azgrills/widgets/background_widget.dart';
import 'package:azgrills/widgets/custom_Rect_Button.dart';
import 'package:azgrills/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
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
                          "Forgot Password",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Please enter your email to recieve a link to create a new password via email.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      OwnTextFieldWidget(
                        hintValue: "Email",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.email, color: Colors.grey),
                        ),
                      ),
                      Expanded(child: Container()),
                      RoundedCustomButton(
                        iconBack: true,
                        lable: "SEND",
                        buttonColor: Colors.red,
                        textColor: Colors.white,
                        onTap: () {},
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
