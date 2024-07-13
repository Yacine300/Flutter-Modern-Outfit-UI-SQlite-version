import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four/helper/db_helper.dart';
import 'package:four/models/Product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addItem(
      {pickedImage,
      pickedSubTitle,
      pickedDescreption,
      pickedMark,
      pickedClassification,
      pickedPrice}) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        classification: pickedClassification,
        descreption: pickedDescreption,
        image: [pickedImage],
        subTitle: pickedSubTitle,
        isLicked: 0,
        mark: pickedMark,
        price: pickedPrice);

    if (!_items.contains(newProduct)) _items.add(newProduct);
    notifyListeners();

    DBHelper.insert('produit', {
      'id': newProduct.id,
      'mark': newProduct.mark,
      'subtitle': newProduct.subTitle,
      'descreption': newProduct.descreption,
      'price': newProduct.price,
      'image': newProduct.image.first.path,
      'isLicked': newProduct.isLicked
    });
  }

  Product? findById(String produitID) {
    return _items.firstWhere((element) => element.id == produitID);
  }

  void deleteById(String productId) async {
    await DBHelper.deleteItem(productId);
    _items.removeWhere((element) => element.id == productId);
  }

  Future<void> fetchAnsSetsProducts() async {
    final dataList = await DBHelper.fetchData('produit');

    _items = dataList
        .map((e) => Product(
            classification: e['classification'].toString(),
            id: e['id'].toString(),
            descreption: e['descreption'].toString(),
            image: [File(e['image'].toString())],
            subTitle: e['subtitle'].toString(),
            price: e['price'] as double,
            mark: e['mark'].toString(),
            isLicked: e['isLicked'] as int))
        .toList();
    notifyListeners();
  }

  Future<void> update(
      {id,
      subTitle,
      image,
      price,
      mark,
      descreption,
      isLicked,
      classification}) async {
    await DBHelper.updateItem(
        id: id,
        descrption: descreption,
        image: image,
        isLicked: isLicked,
        mark: mark,
        price: price,
        classification: classification,
        title: subTitle);
    Product updatedProduct = Product(
        id: id,
        classification: classification,
        descreption: descreption,
        image: [File(image)],
        isLicked: isLicked,
        mark: mark,
        price: price,
        subTitle: subTitle);
    Product? produit = findById(id);

    _items[_items.indexOf(produit!)] = updatedProduct;
    notifyListeners();
  }
}
