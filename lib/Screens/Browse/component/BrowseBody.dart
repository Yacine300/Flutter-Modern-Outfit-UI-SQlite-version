import 'package:flutter/material.dart';

import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';

import 'package:four/Screens/Browse/component/BrowseProducts.dart';
import 'package:four/Screens/Browse/component/IntroAndDate.dart';
import 'package:four/Screens/Browse/component/Pub.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';

import 'CategorieData.dart';

class BrowseBody extends StatefulWidget {
  @override
  State<BrowseBody> createState() => _BrowseBodyState();
}

class _BrowseBodyState extends State<BrowseBody> {
  int _currentIndex = 0;
  late Future<void> iniData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfiguration().init(context);
    iniData = Provider.of<Products>(context).fetchAnsSetsProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: iniData,
        builder: (context, snapshot) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IntroAndDate(),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfiguration.defaultSize /
                            5, /*horizontal: SizeConfiguration.defaultSize / 4*/
                      ),
                      child: DelayedDisplay(
                          slidingCurve: Curves.bounceIn,
                          delay: Duration(milliseconds: 400),
                          slidingBeginOffset: Offset(0, 0),
                          child: Pub())),
                  Container(
                    height: SizeConfiguration.defaultSize / 2,
                    width: SizeConfiguration.screenwidth,
                    padding: EdgeInsets.only(
                        left: SizeConfiguration.screenwidth * 0.1,
                        right: SizeConfiguration.screenwidth * 0.1),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: menuCategorie.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfiguration.defaultSize / 3,
                                  top: 10,
                                  bottom: 5),
                              child: DelayedDisplay(
                                  slidingCurve: Curves.ease,
                                  delay: Duration(milliseconds: 1000),
                                  slidingBeginOffset: Offset(-20, 0),
                                  child: menu(index: index)),
                            )),
                  ),
                  SizedBox(
                    height: SizeConfiguration.defaultSize / 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfiguration.defaultSize / 4,
                    ),
                    child: const BrowseProducts(),
                  )
                ],
              ),
            ));
  }

  Widget buildDot({index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: SizeConfiguration.defaultSize +
              SizeConfiguration.defaultSize / 2),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 5,
        width: _currentIndex == index ? 20 : 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _currentIndex == index ? Colors.white : Colors.white,
        ),
      ),
    );
  }

  Widget menu({index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            menuCategorie[index],
            style: TextStyle(
                fontWeight: _currentIndex == index
                    ? FontWeight.w500
                    : FontWeight.normal,
                color:
                    _currentIndex == index ? Colors.black87 : Colors.grey[400]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: _currentIndex == index
                ? Container(
                    height: 1.5,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black87,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
