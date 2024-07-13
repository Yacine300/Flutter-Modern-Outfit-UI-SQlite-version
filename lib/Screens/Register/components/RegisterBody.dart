import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four/Screens/Register/components/RegisterForm.dart';
import '../../../Composant/SizeConfiguration.dart';

import 'FormulaireRegister.dart';
import 'IntroRegister.dart';

class RegisterBody extends StatefulWidget {
  @override
  State<RegisterBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<RegisterBody> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            IntroRegister(),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
