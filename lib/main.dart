import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/pages/intro_page.dart';
import 'package:grocery_app/routes/routes_names.dart';
import 'package:grocery_app/screens/first_screen.dart';
import 'package:grocery_app/screens/second_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MaterialApp(home: GroceryApp()), );
}

class GroceryApp extends StatefulWidget {
  const GroceryApp({super.key});

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  int myIndex = 0;
  List<Widget> widgetList = [
    IntroPage(),
    FirstScreen(screenArguments: null),
     SecondScreen(screenArguments: null)
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( create: (context) => CartModel(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          Routes.editProfile: (context) => FirstScreen(screenArguments: null),
          Routes.viewProfile: (context) => SecondScreen(screenArguments: null),
        },
        debugShowCheckedModeBanner: false,
      home: Scaffold(
    body: Center(child: widgetList[myIndex],),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'
              '',),
        ],
      ),
    ),
    )
    );
  }
}
