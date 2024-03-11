

import 'package:my_flutter_calculator/models/grocery_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class GroceryViewModel extends BaseViewModel {

  int counter = 0;
  int index = 0;
  ItemType selectedItemType = ItemType.food;

  void setCounter() {
    counter++;
    notifyListeners();
  }

  List<GroceryModel> _BeveragesList = [
    GroceryModel(name: "Orange juice", price: 10, image: "assets/images/orange"
        ".jpeg"),
    GroceryModel(name: "Apple juice",
        price: 10, image: "assets/images/apple.png")
  ];

  List<GroceryModel> _foodList = [
    GroceryModel(name: "Biryani", price: 5, image: "assets/images/biryani.jpeg"),
    GroceryModel(name: "Karahi",
        price: 10, image: "assets/images/karahi.jpeg")
  ];

  List<GroceryModel> get itemList {
    ItemType itemType = selectedItemType; // Replace this with the actual enum
    // value you want to use

    switch (itemType) {
      case ItemType.food:
        return _foodList;
      case ItemType.beverage:
        return _BeveragesList;
      default:
        throw Exception("Invalid ItemType");
    }
  }

  void updateSelectedItemType(ItemType itemType) {
    selectedItemType = itemType;
    notifyListeners();
  }



  // List<GroceryModel> get foodsList => _foodList;
  // List<GroceryModel> get karahiList => _BeveragesList;

  void addGroceryItem(GroceryModel model) {
    _foodList.add(model);
    notifyListeners();
  }
}

enum ItemType {
  food,
  beverage,
}