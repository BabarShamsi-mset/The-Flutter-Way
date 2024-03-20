

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/grocery_model.dart';

@RoutePage()
class GroceryDetailView extends StatelessWidget {
  const GroceryDetailView({required this.groceryModel});

  final GroceryModel groceryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Your Argument is:" +groceryModel.name, style: const TextStyle
            (fontSize: 20.0),),
        SizedBox(height: 20.0,),
        Image.asset(groceryModel.image, fit: BoxFit.cover),
        ],
      ),
    );
  }
}