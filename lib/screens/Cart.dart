import 'package:azgrills/config/colors.dart';
import 'package:azgrills/config/utils.dart';
import 'package:azgrills/models/models.dart';
import 'package:azgrills/screens/HomeScreen.dart';
import 'package:azgrills/services/cart_service.dart';
import 'package:azgrills/services/firbase_auth_service.dart';
import 'package:azgrills/widgets/background_widget.dart';
import 'package:azgrills/widgets/cart_counter_widget.dart';
import 'package:azgrills/widgets/custom_Rect_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0.0;

  _makeTotal() {
    var pr = Provider.of<CartService>(context, listen: false);
    pr.items.forEach((element) {
      total += element.rate;
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _makeTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return Consumer<CartService>(builder: (context, cartService, child) {
          var itemList = cartService.items;

          return BackgroundWidget(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: primaryColor,
                leading: Icon(Icons.menu),
                centerTitle: true,
                title: Text(
                  "CART",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.add_shopping_cart), onPressed: () {})
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: List.generate(itemList.length, (index) {
                        return CartCounterWidget(
                          rate: itemList[index].rate,
                          rateMinus: (value, count) {
                            if (count <= 0) {
                              cartService.deleteItem(itemList[index].type);
                              total -= value;
                              setState(() {});
                              return;
                            }

                            setState(() {
                              total -= value;
                            });
                            cartService.updateItemCount(
                                itemList[index].type, count);
                          },
                          rateAdd: (value, count) {
                            setState(() {
                              total += value;
                            });
                            cartService.updateItemCount(
                                itemList[index].type, count);
                          },
                          assetImage: 'assets/burger_sandwich_PNG4135.png',
                          label: itemList[index].type.toUpperCase(),
                          textColor: Colors.grey,
                        );
                      }),
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sub-total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          "Rs.$total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Delivery",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          "Starndard (free)",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          total > 0 ? "Rs.${total + 20}" : "Rs.0.0",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    cartService.state == ViewState.Busy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : RoundedCustomButton(
                            onTap: () async {
                              if (cartService.items.length < 1) return;
                              try {
                                await cartService.makeOrder(Order(
                                    totalAmount: total + 20,
                                    userId: authService.userInformation.uid,
                                    name:
                                        authService.userInformation.displayName,
                                    address: "some where on earth",
                                    instruction: "nothing",
                                    email: authService.userInformation.email,
                                    mobileNumber: "123243",
                                    orderItems: cartService.items,
                                    total: total,
                                    charges: 20.0));

                                await showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK"))
                                        ],
                                        title: Text("Success"),
                                        content: Text("Order Placed"),
                                      );
                                    });

                                cartService.cartClear();

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (route) => false);
                              } catch (e) {
                                print(e);
                                await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK"))
                                        ],
                                        title: Text("Failed"),
                                        content: Text("Something went wrong"),
                                      );
                                    });
                              }
                            },
                            lable: "OREDR",
                            buttonColor: primaryColor,
                            textColor: Colors.white,
                          ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
