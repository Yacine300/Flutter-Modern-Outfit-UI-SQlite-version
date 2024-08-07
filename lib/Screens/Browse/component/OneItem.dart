import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Screens/Details/Detail.dart';

class OneItem extends StatefulWidget {
  final String id, mark, subTitle;
  final File image;
  final double price;
  final int isLicked;

  const OneItem(
      {required this.id,
      required this.image,
      required this.mark,
      required this.price,
      required this.subTitle,
      required this.isLicked});
  @override
  State<OneItem> createState() => _OneItemState(
      id: id,
      image: image,
      isLicked: isLicked,
      mark: mark,
      price: price,
      subTitle: subTitle);
}

class _OneItemState extends State<OneItem> {
  final String id, mark, subTitle;
  final File image;
  final double price;
  int isLicked;

  _OneItemState(
      {required this.id,
      required this.image,
      required this.mark,
      required this.price,
      required this.subTitle,
      required this.isLicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      id: id,
                    )));
      },
      child: Container(
          //height: SizeConfiguration.defaultSize * 3,          //  grid deledgate in gridView.duilder
          //width: SizeConfiguration.defaultSize * 2.5,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                  child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mark,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            fontFamily: 'Manjari'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ ' + price.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => setState(() {
                              if (isLicked == 0) {
                                isLicked = 1;
                              } else {
                                isLicked = 0;
                              }
                            }),
                            child: Container(
                              height: SizeConfiguration.defaultSize / 4,
                              width: SizeConfiguration.defaultSize / 4,
                              child: isLicked == 1
                                  ? SvgPicture.asset(
                                      "assets/icons/galb_plein.svg",
                                      fit: BoxFit.cover,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/galb.svg",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
