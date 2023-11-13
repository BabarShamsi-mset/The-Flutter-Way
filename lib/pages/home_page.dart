

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(context),
    ),
    backgroundColor: Colors.transparent, //You can make this transparent
    elevation: 0.0, //No shadow),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator
          .push(context, MaterialPageRoute(builder: (context) {
            return CartPage();
      })),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),),
      body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Text("Good Morning")
        ),

        const SizedBox(height: 16,),


        Padding(padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text("Let's Order fresh Items for you",
              style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            ),
        ),

        const Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Divider(),
      ),

        const SizedBox(height: 16,),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Text("Fresh Items", style: TextStyle(fontSize: 16),),
        ),
        
        Expanded(child: Consumer<CartModel>(builder: (context, value, child) {
          return GridView.builder(
              itemCount: value.shopItems.length,
              padding: EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
                childAspectRatio: 1/ 1.3,
          ), itemBuilder: (context, index) {
            return GroceryItemTile(itemName: value.shopItems[index][0],
                itemPrice: value.shopItems[index][1],
                itemPath: value.shopItems[index][2],
                color: value.shopItems[index][3],
              onPressed: () {
              Provider.of<CartModel>(context, listen: false).addItemToCart(index);
              },
            );
          });
        },))
      ],
    )));
  }
  
}