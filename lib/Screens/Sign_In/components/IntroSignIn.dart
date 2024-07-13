import 'package:flutter/material.dart';
import '../../../Composant/SizeConfiguration.dart';

class IntroSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SizeConfiguration.defaultSize * 0.5,
            bottom: SizeConfiguration.defaultSize * 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello Again !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfiguration.defaultSize / 10,
            ),
            Text(
              "wellcome back you have been missed",
              style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.w100,

                  color: Colors.grey[600]),
            ),
          ],
        ));
  }
}
