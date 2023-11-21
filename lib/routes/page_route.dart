

import 'package:flutter/cupertino.dart';

abstract class ScreenArguments {}

abstract class ScreenRoutesStateless<T> extends StatelessWidget {
  final ScreenArguments? screenArguments;

  const ScreenRoutesStateless({super.key, required this.screenArguments});

  T? arguments() {
    if (screenArguments is T) {
      return screenArguments as T;
    }
    else {
      return null;
    }
  }


}

abstract class ScreenRouteStateful<T> extends StatefulWidget {
  final ScreenArguments? screenArguments;

  const ScreenRouteStateful({super.key, required this.screenArguments});

  T? arguments() {
    if(screenArguments is T) {
      return screenArguments as T;
    }
    else {
      return null;
    }
  }
}



