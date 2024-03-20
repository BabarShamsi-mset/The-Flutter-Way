

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModels/grocery_view_model.dart';

class HorizontalTilesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomListTile("Fruits"),
            CustomListTile("Food"),
            CustomListTile("Fast food"),
            CustomListTile("Vegetables"),
            CustomListTile("Beverage"),
            CustomListTile("Sweets"),
            CustomListTile("Crockery"),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String typeOfTile;

  CustomListTile(this.typeOfTile);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<GroceryViewModel>(context);
    var selectedItemType = viewModel.selectedItemType; // Get the selected item type
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        color: selectedItemType.name.replaceAll("_", " ") == typeOfTile //
        // Check if this tile
        // is selected
            ? Color(0xFF1A253D) // Set the color to blue if selected
            : Color.fromRGBO(220, 220, 220, 1), // Otherwise, set default color
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        elevation: 2,
        margin: EdgeInsets.fromLTRB(6, 6, 6, 0),
        child: InkWell(
          onTap: () {
            if (typeOfTile == "Fruits") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Fruits);
            } else if (typeOfTile == "Food") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Food);
            }
            else if (typeOfTile == "Fast food") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Fast_food);
            }
            else if (typeOfTile == "Vegetables") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Vegetables);
            }
            else if (typeOfTile == "Beverage") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Beverage);
            }
            else if (typeOfTile == "Sweets") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Sweets);
            }
            else if (typeOfTile == "Crockery") {
              viewModel.updateSelectedItemType(
                  viewModel.selectedItemType = ItemType.Crockery);
            }
            // handle tap
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                  typeOfTile,
                  style: TextStyle(
                    fontSize: 12,
                    color: selectedItemType.name.replaceAll("_", " ") == typeOfTile
                        ? Colors.white // Set text color to white if selected
                        : Colors.black, // Otherwise, set default text color,
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}