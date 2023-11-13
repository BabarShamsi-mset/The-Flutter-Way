

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {


  final List mShopItems = [
    ["Apple", 250, "lib/images/apple.png", Colors.redAccent],
    ["Mango", 150, "lib/images/mango.png", Colors.yellow],
    ["Orange", 350, "lib/images/orange.png", Colors.orangeAccent],
    ["kiwi", 500, "lib/images/kiwi.png", Colors.green],
  ];

  get shopItems => mShopItems;

  List mCartItems = [];

  get cartItems => mCartItems;

  void addItemToCart (int index) {
    mCartItems.add(shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    mCartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    num totalPrice = 0;
    for (int i = 0; i < mCartItems.length; i++) {
      totalPrice = totalPrice + mCartItems[i][1];
    }
    return totalPrice.toString();
  }


}