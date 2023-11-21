

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/screen_data.dart';
import 'package:grocery_app/routes/page_route.dart';

class SecondScreen extends ScreenRoutesStateless<ScreenData> {

  final ScreenData? screenArguments;

  SecondScreen({required this.screenArguments}) : super
      (screenArguments: screenArguments);


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenData;

    // TODO: implement build
    return Scaffold(

      body: Center(
        child: Text (args.name),
      ),


    );
  }

//    body: ElevatedButton( child: Text("Go Back"), onPressed: () => Navigator
//           .popAndPushNamed(context, '/one'),

}