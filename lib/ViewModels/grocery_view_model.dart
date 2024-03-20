

import 'package:my_flutter_calculator/models/grocery_model.dart';
import 'package:stacked/stacked.dart';

class GroceryViewModel extends BaseViewModel {

  int index = 0;
  ItemType selectedItemType = ItemType.Fruits;
  String imagePrefix = 'assets/images/';

  List<GroceryModel> _FruitList = [
    GroceryModel(
        name: "Apple",
        price: 1.50,
        image: "assets/images/apple_cart.png",
    favourite: "assets/images/favourite.png"),
    GroceryModel(
        name: "Strawberry",
        price: 2.50,
        image: "assets/images/straw"
            "ber"
            "ry_cart.png",
        favourite: "assets/images/favourite.png"),
    GroceryModel(
        name: "Capcicum",
        price: 1.50,
        image: "assets/images/capcicum_cart.png",
        favourite: "assets/images/favourite.png"),
    GroceryModel(
        name: "Dragon",
        price: 1.25,
        image: "assets/images/dragon_cart.png",
        favourite: "assets/images/favourite.png"),
  ];

  List<GroceryModel> _foodList = [
    GroceryModel(name: "Biryani", price: 5, image: "assets/images/biryani.jpeg",
        favourite: "assets/images/favourite.png"),
    GroceryModel(name: "Karahi",
        price: 10, image: "assets/images/karahi.jpeg",
        favourite: "assets/images/favourite.png")
  ];

  List<GroceryModel> get itemList {
    ItemType itemType = selectedItemType; // Replace this with the actual enum
    // value you want to use

    switch (itemType) {
      case ItemType.Fruits:
        return _FruitList;
      case ItemType.Food:
        return _foodList;
      default:
        return [];
    }
  }

  void updateSelectedItemType(ItemType itemType) {
    selectedItemType = itemType;
    notifyListeners();
  }

  void toggleImage(int index) {
    itemList[index].isImageToggled = !itemList[index].isImageToggled;

    itemList[index].favourite = itemList[index].isImageToggled ?
    '${imagePrefix}un_favourite.png' : '${imagePrefix}favourite.png';
    notifyListeners();
  }

  void addGroceryItem(GroceryModel model) {
    _foodList.add(model);
    notifyListeners();
  }
}

enum ItemType {
  Fruits,
  Food,
  Fast_food,
  Vegetables,
  Beverage,
  Sweets,
  Crockery
}