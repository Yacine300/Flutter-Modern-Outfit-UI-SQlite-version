import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Carts.dart';
import 'SizeConfiguration.dart';

class CartNavBar extends StatelessWidget {
  const CartNavBar();
  @override
  Widget build(BuildContext context) {
    double _total = Provider.of<Carts>(context, listen: true).total;
    return Container(
        height: SizeConfiguration.screenheight / 4,
        width: SizeConfiguration.screenwidth,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(0, -1), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfiguration.defaultSize / 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: SizeConfiguration.defaultSize / 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text('\$ $_total',
                      style: TextStyle(
                          //fontFamily: 'GFSDidot',
                          fontSize: 20,
                          fontWeight: FontWeight.w800))
                ],
              ),
              Container(
                width: SizeConfiguration.screenwidth,
                height: SizeConfiguration.defaultSize / 1.5,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: _total == 0 ? Colors.grey[600] : Colors.black87,
                ),
                child: Center(
                  child: Text(
                    'Payement',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
