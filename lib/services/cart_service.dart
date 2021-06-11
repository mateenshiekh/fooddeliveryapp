import 'package:azgrills/config/utils.dart';
import 'package:azgrills/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartService extends ChangeNotifier {
  final databaseReference = Firestore.instance;
  List<MenuItem> _menuitems = [];
  ViewState _state;

  List<MenuItem> get items => _menuitems;
  ViewState get state => _state;

  void _setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setItem(MenuItem item) {
    _menuitems.add(item);
    notifyListeners();
  }

  void cartClear() {
    _menuitems.clear();
  }

  updateItemCount(String tag, int count) {
    for (var i = 0; i < _menuitems.length; i++) {
      var element = _menuitems[i];

      if (element.type == tag) {
        element.count = count;
        notifyListeners();
        break;
      }
    }
  }

  makeOrder(Order order) async {
    _setState(ViewState.Busy);
    print(order.toJson());
    DocumentReference ref =
        await databaseReference.collection('orders').add(order.toJson());
    _setState(ViewState.Idle);

    print(ref.documentID);
  }

  deleteItem(String type) async {
    _menuitems.removeWhere((element) => element.type == type);
  }
}
