import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Composant/SizeConfiguration.dart';

import '../../Composant/DefaultAppbar.dart';
import 'components/SignInBody.dart';

class SignIn extends StatelessWidget {
  static String routeName = "/Sign_in.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: DefaultAppbar(
        title: "Sign in",
      ),
      body: DelayedDisplay(
          slidingCurve: Curves.ease,
          slidingBeginOffset: Offset(0, 0),
          delay: Duration(milliseconds: 800),
          child: SignInBody()),
    );
  }
}
