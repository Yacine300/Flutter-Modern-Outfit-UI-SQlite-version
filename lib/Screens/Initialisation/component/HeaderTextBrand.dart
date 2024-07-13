import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';

class HeaderTextBrand extends StatelessWidget {
  const HeaderTextBrand();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: -10,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0,
              sigmaY: 4.0,
            ),
            child: Container(
              width: SizeConfiguration.screenwidth / 2,
              height: SizeConfiguration.screenheight,
              color: Colors.white24.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SafeArea(
                      child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfiguration.defaultSize / 2),
                    child: const Text(
                      "Morin",
                      style: TextStyle(
                          fontSize: 35,
                          //   fontFamily: 'GFSDidot',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
