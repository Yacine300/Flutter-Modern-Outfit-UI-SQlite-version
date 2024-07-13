import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SizeConfiguration.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSize {
  final String title;
  DefaultAppbar({required this.title});
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
      ),
      titleSpacing: SizeConfiguration.defaultSize,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
