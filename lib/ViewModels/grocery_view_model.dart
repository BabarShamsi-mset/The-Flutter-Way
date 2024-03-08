

import 'package:my_flutter_calculator/models/grocery_model.dart';
import 'package:stacked/stacked.dart';

class GroceryViewModel extends BaseViewModel {
  List<GroceryModel> _groceryList = [
    GroceryModel(name: "Apple", price: 5, image: "assets/images/apple.png"),
    GroceryModel(name: "orange",
        price: 10, image: "assets/images/apple.png")
  ];

  List<GroceryModel> get groceryList => _groceryList;

  void addGroceryItem(GroceryModel model) {
    _groceryList.add(model);
    notifyListeners();
  }
}