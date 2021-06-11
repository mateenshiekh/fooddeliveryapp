import 'package:azgrills/config/colors.dart';
import 'package:azgrills/screens/Cart.dart';
import 'package:azgrills/screens/SelectionScreen.dart';
import 'package:azgrills/screens/SignUpScreen.dart';
import 'package:azgrills/services/cart_service.dart';
import 'package:azgrills/services/firbase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CartService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AZGrills',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: primaryColor,
          primaryColorBrightness: Brightness.dark,
          accentColor: secondaryColor,
          accentColorBrightness: Brightness.light,
          buttonTheme: ButtonThemeData(
            buttonColor: secondaryColor,
            splashColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            color: appBarLightColor,
            brightness: Brightness.light,
            elevation: 0,
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        darkTheme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          primaryColor: primaryColor,
          primaryColorBrightness: Brightness.dark,
          accentColor: secondaryColor,
          accentColorBrightness: Brightness.light,
          buttonTheme: ButtonThemeData(
            buttonColor: secondaryColor,
            splashColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          appBarTheme: AppBarTheme(
            color: appBarDarkColor,
            brightness: Brightness.dark,
            elevation: 0,
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        home: SignUpPage(),
      ),
    );
  }
}
