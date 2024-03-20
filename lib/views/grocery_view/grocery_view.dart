import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_calculator/routes/auto_route_config.gr.dart';
import 'package:my_flutter_calculator/views/services/grocery_view_service.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModels/grocery_view_model.dart';
import 'horizontal_tiles.dart';

@RoutePage()
class GroceryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroceryViewModel>.reactive(
      // Set disposeViewModel to false This tells Stacked not to dispose the
      // ViewModel when the widget is removed from the widget tree
      disposeViewModel: false,
      // initialiseSpecialViewModelsOnce to true tell the ViewModelBuilder you only want the initialisation for a
      //  specialty view model to fire once.
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<GroceryViewModel>(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Grocery App Using Stack')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HorizontalTilesList(),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 20),
                itemCount: model.itemList.length,
                itemBuilder: (BuildContext context, index) {
                  return SizedBox(
                    height: 50,
                    child: MyCustomGridItem(index: index, model: model)
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomGridItem extends StatefulWidget {
  final int index;
  final GroceryViewModel model;

  const MyCustomGridItem({required this.index, required this.model});

  @override
  _MyCustomGridItemState createState() => _MyCustomGridItemState();
}

class _MyCustomGridItemState extends State<MyCustomGridItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(GroceryDetailRoute(groceryModel: widget
            .model.itemList[widget.index]));
      },
      child: Card(
      borderOnForeground: true,
      color: Color(0xFFF7F7F7),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(top: 20, left: 0, right: 0,
              child: Center(
                child:  Image.asset(widget
                    .model.itemList[widget
                    .index].image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain),
              )),
          Positioned(bottom: 10, left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget
                      .model.itemList[widget
                      .index].name, style: const TextStyle(color:
              Colors.black)),
                  SizedBox(height: 1),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFF9BD06), size: 16,),
                      Icon(Icons.star, color: Color(0xFFF9BD06), size: 16,),
                      Icon(Icons.star, color: Color(0xFFF9BD06), size: 16,),
                      Icon(Icons.star, color: Color(0xFFF9BD06), size: 16,),
                      Icon(Icons.star, color: Color(0xFFF9BD06), size: 16,),
                    ],
                  ),
                  SizedBox(height: 1),
                      priceTagTextView(),
                ],
              )),


          Positioned(right: 0, bottom: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.model.toggleImage(widget.index);

                  });
                },
                child: Image.asset(
                    widget.model.itemList[widget.index].favourite,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover)),
              )
        ],
    ),
    ));
  }

  RichText priceTagTextView() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          const TextSpan(
            text: '\$',
          ),
          TextSpan(
            text: '${widget
                .model.itemList[widget
                .index].price}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: '/kg',
          ),
        ],
      ),
    );
  }
}