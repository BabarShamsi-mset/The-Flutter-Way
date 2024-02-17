
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ViewModels/grocery_view_model.dart';
import '../models/grocery_model.dart';

class GroceryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroceryViewModel>.reactive(viewModelBuilder: () => GroceryViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(title: Text('Grocery App Using Stack')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                model.addGroceryItem(GroceryModel(name: "Apple", price: 2.0));
              }, child: Text('Add Grocery Item'),),
              SizedBox(height: 20),
              Text('Grocery List:'),
              for(var item in model.groceryList)
                ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price}'),
                )
            ],
          ),
        ));
  }
}