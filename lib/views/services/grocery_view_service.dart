

import 'dart:js_interop';

import 'package:get_it/get_it.dart';
import 'package:my_flutter_calculator/ViewModels/grocery_view_model.dart';

final locator = GetIt.instance;

void setupLocator() => locator.registerLazySingleton(() => GroceryViewModel());



