
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {

  final String itemName;
  final int itemPrice;
  final String itemPath;
  final color;
  void Function()? onPressed;

   GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: color[100],
        borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Image.asset(itemPath, height: 64,),

          Text(itemName),

          MaterialButton(onPressed: onPressed,
          color: color[800],
          child: Text(
            '\Rs $itemPrice',
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold),
          ),)
        ],),
      ),
    );
  }
}
