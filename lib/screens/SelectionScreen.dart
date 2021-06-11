import 'package:azgrills/config/colors.dart';
import 'package:azgrills/models/models.dart';
import 'package:azgrills/screens/Cart.dart';
import 'package:azgrills/services/cart_service.dart';
import 'package:azgrills/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionPage extends StatefulWidget {
  final String imagePath;
  final String tag;
  SelectionPage({Key key, this.imagePath, this.tag}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cartService, child) {
        bool isAdded = false;
        cartService.items.forEach((element) {
          if (element.type == widget.tag) {
            isAdded = true;
          }
        });
        return BackgroundWidget(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              leading: Icon(Icons.menu),
              title: Text(
                "FEATURED PRODUCTS",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => CartPage()))
                          .then((value) {
                        setState(() {});
                      });
                    })
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Center(
                          child: Text(
                        widget.tag.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(
                    child: Hero(
                        tag: widget.tag, child: Image.asset(widget.imagePath)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          "Broccoli is lovely green cruciferous vegetable It's healthy, delicious and",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                if (isAdded) return;

                                cartService.setItem(MenuItem(
                                    type: widget.tag, count: 1, rate: 400));
                                setState(() {});
                              },
                              color: primaryColor,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    isAdded ? "ADDED" : "TRY THIS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.all(5),
                                height: 100,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: appredColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                      widget.imagePath,
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      widget.tag,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.all(5),
                                height: 100,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                      widget.imagePath,
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      widget.tag,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.all(5),
                                height: 100,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: appyellowColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                      widget.imagePath,
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      widget.tag,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
