

import 'package:my_flutter_calculator/models/grocery_model.dart';
import 'package:stacked/stacked.dart';

class GroceryViewModel extends BaseViewModel {
  List<GroceryModel> _groceryList = [];

  List<GroceryModel> get groceryList => _groceryList;

  void addGroceryItem(GroceryModel model) {
    _groceryList.add(model);
    notifyListeners();
  }
}