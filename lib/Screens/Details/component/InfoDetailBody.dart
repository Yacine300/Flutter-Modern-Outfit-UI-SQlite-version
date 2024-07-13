import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/models/Product.dart';
import 'package:provider/provider.dart';

import '../../../Providers/Carts.dart';

class InfoDetailBody extends StatefulWidget {
  final targetProduct;

  InfoDetailBody({this.targetProduct});

  @override
  State<InfoDetailBody> createState() => _InfoDetailBodyState();
}

class _InfoDetailBodyState extends State<InfoDetailBody> {
  late Carts _carts;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _carts = Provider.of<Carts>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfiguration.screenheight * 0.4,
        width: SizeConfiguration.screenwidth,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.targetProduct.mark,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.targetProduct.subTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontFamily: 'Manjari'),
                      ),
                      const Spacer(),
                      Text(
                        "\$${widget.targetProduct.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                widget.targetProduct.descreption,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Manjari',
                    fontWeight: FontWeight.w300),
              ),
              InkWell(
                onTap: () {
                  _carts.addItem(product: widget.targetProduct);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('product added with success'),
                  ));
                },
                child: Container(
                  width: SizeConfiguration.screenwidth,
                  height: SizeConfiguration.defaultSize / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black87,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
