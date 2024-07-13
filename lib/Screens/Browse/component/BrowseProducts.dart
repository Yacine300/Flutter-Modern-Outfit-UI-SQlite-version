import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';
import 'package:provider/provider.dart';

import 'OneItem.dart';

class BrowseProducts extends StatefulWidget {
  const BrowseProducts();

  @override
  State<BrowseProducts> createState() => _BrowseProductsState();
}

class _BrowseProductsState extends State<BrowseProducts> {
  late List _dummyProduct;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dummyProduct = Provider.of<Products>(context).items;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: _dummyProduct.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (SizeConfiguration.defaultSize /
            SizeConfiguration.defaultSize /
            1.8),
        mainAxisSpacing: SizeConfiguration.defaultSize / 3,
        crossAxisSpacing: SizeConfiguration.defaultSize / 3,
      ),
      itemBuilder: (context, index) => DelayedDisplay(
        slidingCurve: Curves.bounceIn,
        delay: Duration(milliseconds: 700 + index * 3),
        slidingBeginOffset: Offset(0, 0),
        child: OneItem(
          id: _dummyProduct[index].id,
          image: _dummyProduct[index].image.first,
          mark: _dummyProduct[index].mark,
          subTitle: _dummyProduct[index].subTitle,
          price: _dummyProduct[index].price,
          isLicked: _dummyProduct[index].isLicked,
        ),
      ),
    );
  }
}
