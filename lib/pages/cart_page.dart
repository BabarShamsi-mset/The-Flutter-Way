

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(context),
        ),
        title: const Text("My Cart"),),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: ListView.builder(
            itemCount: value.mCartItems.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Image.asset(value.mCartItems[index][2],
                height: 36,
                ),
              // ignore: prefer_interpolation_to_compose_strings
              subtitle: Text('Rs ' + value.mCartItems[index][1].toString()),
              title: Text(value.mCartItems[index][0]),
                trailing: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () => Provider.of<CartModel>(context, listen: 
                  false).removeItemFromCart(index),
                ),
              ),
            ),
          );
          })
          ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.green, borderRadius:
                BorderRadius.circular(10)),
                
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            value.calculateTotalPrice(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

                      Container(
                        decoration: BoxDecoration(border: Border.all(color:
                        Colors.green.shade100), borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          children: [
                            Text("Pay Now", style: TextStyle(color: Colors
                                .white),),
                            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white,)
                          ],
                        ),
                      )
                  ],
                ),


              ),
            )


          ],);
        },
      ),

    );
  }
}
