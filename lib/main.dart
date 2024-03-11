import 'package:flutter/material.dart';
import 'package:my_flutter_calculator/ViewModels/grocery_view_model.dart';
import 'package:my_flutter_calculator/models/grocery_model.dart';
import 'package:my_flutter_calculator/views/grocery_view.dart';
import 'package:my_flutter_calculator/views/home_view/home_view.dart';
import 'package:my_flutter_calculator/views/services/grocery_view_service.dart';
import 'package:stacked/stacked.dart';

void main() {
  setupLocator();
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
     home: const HomeView(),
   );
  }
  
}