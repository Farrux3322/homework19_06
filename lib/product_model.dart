class ProductModel {
  final String image;
  final String title;
  final String describtion;
  final String sale;
  final String price;

  ProductModel(
      {required this.sale,
      required this.price,
      required this.image,
      required this.title,
      required this.describtion});
}
