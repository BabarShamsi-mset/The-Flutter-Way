import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ViewModels/grocery_view_model.dart';
import '../models/grocery_model.dart';

class GroceryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroceryViewModel>.reactive(
      viewModelBuilder: () => GroceryViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Grocery App Using Stack')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HorizontalTilesList(),
            const SizedBox(height: 20.0),
            Text("Popular"),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: model.groceryList.length,
                itemBuilder: (BuildContext context, index) {
                  return GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          model.groceryList[index].name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text(model.groceryList[index].price.toString()),
                        trailing: const Icon(Icons.shopping_cart),
                      ),
                      // child: Image.network("https://www.kindacode.com/wp-content/uploads/2021/12/phone.jpeg", fit: BoxFit.cover));
                      child: Image.asset(model.groceryList[index].image,
                          fit: BoxFit.cover));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalTilesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomListTile("Foods"),
          CustomListTile("Drinks"),
          CustomListTile("Fast food"),
          CustomListTile("Vegetables"),
          CustomListTile("Beverage"),
          CustomListTile("Sweets"),
          CustomListTile("Crockery"),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String typeOfTile;

   CustomListTile(this.typeOfTile);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Card(
        color: Colors.blueGrey,
        child: InkWell(
          onTap: () {
            // handle tap
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typeOfTile,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
