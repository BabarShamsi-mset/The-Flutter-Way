

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/components/screen_data.dart';
import 'package:grocery_app/routes/page_route.dart';

class ViewProfile extends ScreenRoutesStateless<ScreenData> {

  final ScreenData? screenArguments;

  ViewProfile({required this.screenArguments}) : super
      (screenArguments: screenArguments);


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenData?;
    String name, fatherName;
    int age;
    if(args ==  null) {
      name = "No Value Passed";
      fatherName = "No Value Passed";
      age = 0;
    }
    else {
      name = args.name;
      fatherName = args.fatherName;
      age = args.age;
    }

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text ("Your Name: ", style: GoogleFonts.cairo(fontSize: 17,
              fontWeight:
          FontWeight.bold),),
        ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text (name, style: GoogleFonts.lato(fontSize: 17,
                  fontWeight:
                  FontWeight.w300),),
          ),
                ],
              ),
            ),

            // const Spacer(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text ("Father Name: ", style: GoogleFonts.cairo(fontSize: 17,
                        fontWeight:
              FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text (fatherName, style: GoogleFonts.lato(fontSize: 17,
                        fontWeight:
                        FontWeight.w300),),
                  ),
        ],
              ),
            ),
    // const Spacer(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text ("Your Age: ", style: GoogleFonts.cairo(fontSize: 17,
                        fontWeight:
                    FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text ("$age years old", style: GoogleFonts.lato(fontSize: 17,
                        fontWeight:
                        FontWeight.w300),),
                  ),
                ],
              ),
            ),


          ],

        ),
      ),
    );
  }

//    body: ElevatedButton( child: Text("Go Back"), onPressed: () => Navigator
//           .popAndPushNamed(context, '/one'),

}