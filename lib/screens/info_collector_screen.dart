

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/screen_data.dart';
import 'package:grocery_app/mixins/mixin_route.dart';
import 'package:grocery_app/routes/page_route.dart';
import 'package:grocery_app/routes/routes_names.dart';

class InfoCollector extends ScreenRouteStateful<ScreenArguments> {

  InfoCollector({required super.screenArguments});


  @override
  State<StatefulWidget> createState() {
    return FirstScreenState(screenArguments);
  }
}

class FirstScreenState extends State<InfoCollector> with ScreenNavigation {

  final myControllerForName = TextEditingController();
  final myControllerForFatherName = TextEditingController();
  final myControllerForAge = TextEditingController();

  FirstScreenState(ScreenArguments? screenArguments);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 30,
                top: 30),
                child: Center(child: editTextField("Name",
                    myControllerForName))),

            // const Spacer(),

            Padding(padding: const EdgeInsets.only(
            left: 80.0, right: 80, bottom: 30,
            top: 30),
            child: Center(child: editTextField("Father Name",
                myControllerForFatherName))),

            // const Spacer(),


            Padding(padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 30,
                top: 30),
                child: Center(child: editTextField("Age",myControllerForAge))),

            // const Spacer(),

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
                      screenArguments: ScreenData(name: myControllerForName.text,
                          fatherName: myControllerForFatherName.text,
                          age: int.parse(myControllerForAge.text )));
                },
              ),
            )
          ],

        ));
  }

  Widget editTextField(String labelText, TextEditingController
  myControllerForFatherName) {
    return TextField(
      decoration: InputDecoration(labelText: labelText),
      controller: myControllerForFatherName,
    );
  }
  
}


