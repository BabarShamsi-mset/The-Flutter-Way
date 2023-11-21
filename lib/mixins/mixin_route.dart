

import 'package:flutter/cupertino.dart';
import 'package:grocery_app/routes/page_route.dart';

mixin ScreenNavigation {

  void navigate(BuildContext buildContext, {
    required String routeName, ScreenArguments? screenArguments
  }) {
    Navigator.of(buildContext).pushNamed(routeName, arguments: screenArguments);
  }
}