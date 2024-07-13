import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Composant/SizeConfiguration.dart';

class IntroRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SizeConfiguration.defaultSize * 0.5,
            bottom: SizeConfiguration.defaultSize * 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfiguration.defaultSize / 10,
            ),
            Text(
              "Register on cornucopia",
              style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w100,

                  color: Colors.grey[600]),
            ),
          ],
        ));
  }
}
