

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/screen_data.dart';
import 'package:grocery_app/routes/page_route.dart';
import 'package:grocery_app/screens/first_screen.dart';
import 'package:grocery_app/screens/second_screen.dart';

class Routes {
  static const initialRoute = '/';
  static const editProfile = '/editProfile';
  static const viewProfile = '/viewProfile';


  // right now this is unused need to check how can i use this
  static Route<dynamic> all(RouteSettings settings) {
      if(settings.arguments == null || (settings.arguments !=null &&
          settings.arguments is ScreenArguments)) {
        switch(settings.name) {
          case Routes.editProfile:
            return buildRoute(screen: FirstScreen(screenArguments: null,));
          case Routes.viewProfile:
            return  buildRoute(screen: SecondScreen(screenArguments: tryCastArguments(settings.arguments)));
          default:
            return buildRoute(screen: Container());
        }
      }
      else {
        throw ('Arguments is not null and type does not match ScreenArgument class');
      }
  }

  static Route<dynamic> buildRoute({required Widget screen}) {
    return MaterialPageRoute(builder: (context) => screen
    );
  }

  static ScreenData? tryCastArguments( Object? object) {
    if(object != null && object is ScreenData) {
      return object;
    }
    return null;
  }

}