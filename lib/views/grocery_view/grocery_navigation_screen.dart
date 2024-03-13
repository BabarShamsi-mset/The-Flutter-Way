

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class GroceryNavigationScreen extends StatelessWidget {
  const GroceryNavigationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}