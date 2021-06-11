import 'package:azgrills/config/colors.dart';
import 'package:azgrills/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  color: primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.person,
                            color: primaryColor,
                            size: 40,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "John Doe",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child: Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        dense: true,
                        title: Text(
                          "Full Name",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        subtitle: Text("zeeshi"),
                        trailing: Icon(Icons.edit),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "phone no",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        subtitle: Text("+92300 1234 567"),
                        trailing: Icon(Icons.edit),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "Address1",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        subtitle: Text("northern byp multan"),
                        trailing: Icon(Icons.edit),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "Address1",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        subtitle: Text("northern byp multan"),
                        trailing: Icon(Icons.edit),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "Email",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        subtitle: Text("orlando.smith@gmail.com"),
                        trailing: Icon(Icons.edit),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "Password",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        subtitle: Text("********"),
                        trailing: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
