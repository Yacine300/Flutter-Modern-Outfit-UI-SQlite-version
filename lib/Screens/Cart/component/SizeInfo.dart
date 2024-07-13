import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeInfo extends StatelessWidget {
  const SizeInfo();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Size:',
          style: TextStyle(color: Colors.grey[400], fontSize: 10),
        ),
        Text(
          "S",
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
