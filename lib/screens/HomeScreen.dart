import 'package:azgrills/config/colors.dart';
import 'package:azgrills/screens/SelectionScreen.dart';
import 'package:azgrills/screens/SignUpScreen.dart';
import 'package:azgrills/services/firbase_auth_service.dart';
import 'package:azgrills/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, myService, child) {
        return BackgroundWidget(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 0.5,
                            ),
                            Center(
                              child: Text(
                                "Welcome ${myService.userInformation.displayName}!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  await myService.signOut();
                                } catch (e) {
                                  print(e);
                                }

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()),
                                    (route) => false);
                              },
                              child: Container(
                                child: Image.asset(
                                  'assets/Group 1610.png',
                                  height: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/Group 13.png',
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildTile('burger', 'assets/burger_sandwich_PNG4135.png',
                      primaryColor),
                  SizedBox(
                    height: 15,
                  ),
                  _buildTile(
                      'appetizers',
                      'assets/5488191-appetizer-png-2-foodies-world-appetizer-png-300_254_preview.png',
                      appredColor),
                  SizedBox(
                    height: 15,
                  ),
                  _buildTile('steak', 'assets/steak_PNG90.png', appyellowColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildTile(String tag, String assetImage, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SelectionPage(imagePath: assetImage, tag: tag)));
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                child: Center(
                  child: Hero(tag: tag, child: Image.asset(assetImage)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text(
                          tag.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Center(
                        child: Text(
                          "Lorem ipsum has dummy text for the digital",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )),
    );
  }
}
