

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/screen_data.dart';
import 'package:grocery_app/mixins/mixin_route.dart';
import 'package:grocery_app/routes/page_route.dart';
import 'package:grocery_app/routes/routes_names.dart';
import 'package:grocery_app/screens/second_screen.dart';

class FirstScreen extends ScreenRouteStateful<ScreenArguments> {

  FirstScreen({required super.screenArguments});


  @override
  State<StatefulWidget> createState() {
    return FirstScreenState(screenArguments);
  }
}

class FirstScreenState extends State<FirstScreen> with ScreenNavigation {

  final myController = TextEditingController();

  FirstScreenState(ScreenArguments? screenArguments);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 80,
                top: 160),
                child: Center(child: editTextField())),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: OutlinedButton(
                child: Text('Move Forward', style: TextStyle(color:
                Colors
                    .black,
                    backgroundColor: Colors.yellow,
                    fontWeight: FontWeight.bold),),
                onPressed: () {
                  navigate(context, routeName: Routes.viewProfile ,
                      screenArguments: ScreenData(name: myController.text));
                },
              ),
            )
          ],

        ));
  }

  Widget editTextField() {
    return TextField(
      controller: myController,
    );
  }
  
}


