import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_calculator/views/grocery_view.dart';
import 'package:my_flutter_calculator/views/home_view/home_view_model.dart';
import 'package:stacked/stacked.dart';

import '../cart_view/cart_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<HomeViewModel>.reactive(
       builder: (context, model, child) => Scaffold(
     body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
            ),

            BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(Icons.shopping_cart))
          ],

        ),
       ), viewModelBuilder: () => HomeViewModel()
   );
  }

  Widget getViewForIndex(int index) {
    switch(index) {
      case 0:
        return GroceryView();
      case 1:
        return CartView();
      default:
        return GroceryView();
    }
  }

}