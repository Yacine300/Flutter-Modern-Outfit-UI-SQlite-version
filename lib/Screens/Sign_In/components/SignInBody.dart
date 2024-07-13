import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four/Screens/Sign_In/components/SignFormField.dart';
import '../../../Composant/SizeConfiguration.dart';

import 'IntroSignIn.dart';
import 'SignInFormular.dart';

class SignInBody extends StatefulWidget {
  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntroSignIn(),
              SignForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  final List<String> errors;

  FormError({required this.errors});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formError(error: errors[index])),
    );
  }

  formError({error}) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/exit.svg"),
        SizedBox(
          width: SizeConfiguration.defaultSize / 4,
        ),
        Text(error)
      ],
    );
  }
}
