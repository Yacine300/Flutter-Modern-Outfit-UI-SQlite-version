import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';
import 'package:four/models/Product.dart';
import 'package:provider/provider.dart';

import '../../../Providers/Carts.dart';
import 'HeaderItem.dart';
import 'TileItem.dart';

class CartItems extends StatefulWidget {
  @override
  const CartItems();
  State<CartItems> createState() => _CartItemState();
}

class _CartItemState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    Carts carts = Provider.of<Carts>(context);
    List<Product> _dummyProduct = carts.items;
    return Stack(
      children: [
        ListView.builder(
          itemCount: _dummyProduct.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                background: Container(
                    color: Colors.grey[200],
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfiguration.defaultSize / 4),
                          child: SvgPicture.asset("assets/icons/exit.svg"),
                        ))),
                key: ValueKey<String>(_dummyProduct[index].id),
                direction: DismissDirection.endToStart,
                onDismissed: (DismissDirection direction) {
                  carts.deleteById(_dummyProduct[index].id);
                },
                confirmDismiss: (direction) {
                  return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text("Alert"),
                            content: Text(
                              "Are you sure you want to delete the item from your cart?",
                              style: TextStyle(fontFamily: 'Manjari'),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop(true);
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ));
                },
                child: Column(
                  children: [
                    oneCardItemBuilder(
                        index: index, dummyOneProduct: _dummyProduct[index]),
                    Container(
                      width: SizeConfiguration.defaultSize * 3,
                      height: 1,
                      color: Colors.grey[300],
                    )
                  ],
                ));
          },
        ),
      ],
    );
  }

  Widget oneCardItemBuilder({index, dummyOneProduct}) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfiguration.defaultSize / 5,
                vertical: SizeConfiguration.defaultSize / 5),
            child: HeaderItem(
              index: index,
              dummyOneProduct: dummyOneProduct,
            ),
          ),
          TileItem(
            index: index,
            dummyOneProduct: dummyOneProduct,
          ),
        ],
      ),
    );
  }
}
