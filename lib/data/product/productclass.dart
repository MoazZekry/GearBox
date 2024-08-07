class Product {
  String name;
  String title;
  int price;
  String image;
  String discreption;
  String cat;
  int id;
  Product(
      {required this.name,
      required this.title,
      required this.price,
      required this.image,
      required this.cat,
      required this.id,
      this.discreption = ""});
}
