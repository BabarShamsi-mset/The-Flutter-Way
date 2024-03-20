

class GroceryModel {
  final double price;
  final String name;
  final String image;
  String favourite;
  bool isImageToggled;

  GroceryModel({required this.name, required this.price, required this.image,
    required this.favourite, this.isImageToggled = false});
}