class CartItemModel {
  final String id;
  final String imgUrl;
  final String name;
  final String price;
  int amount;

  CartItemModel(
      {required this.id,
      required this.imgUrl,
      required this.name,
      required this.price,
      this.amount = 1});
}
