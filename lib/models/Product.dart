import 'dart:io';

class Product {
  final String id;
  String mark;
  String classification;
  String subTitle, descreption;
  double price;
  int isLicked;
  List<File> image;

  Product(
      {required this.mark,
      required this.subTitle,
      required this.classification,
      required this.descreption,
      required this.price,
      required this.image,
      required this.id,
      required this.isLicked});
}
