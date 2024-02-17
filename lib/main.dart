import 'package:flutter/material.dart';
import 'package:my_flutter_calculator/ViewModels/grocery_view_model.dart';
import 'package:my_flutter_calculator/models/grocery_model.dart';
import 'package:my_flutter_calculator/views/grocery_view.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Grocery App',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: GroceryView(),
   );
  }
  
}