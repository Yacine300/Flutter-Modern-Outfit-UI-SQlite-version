import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four/Screens/Browse/Browse.dart';
import 'package:four/Screens/Register/Register_screen.dart';

import '../../../Composant/Constant.dart';
import '../../../Composant/SizeConfiguration.dart';
import 'SignInBody.dart';

class SignForm extends StatefulWidget {
  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _keyForm = GlobalKey<FormState>();

  List<String> errors = [];
  late String _email, _password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          buildEmailField(label: 'Email', hint: 'exemple@gmail.com'),
          SizedBox(height: SizeConfiguration.defaultSize / 2),
          buildPassField(label: 'Password', hint: '******'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("remember me"),
              Spacer(),
              Text(
                "Forgot password",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: SizeConfiguration.defaultSize * 0.6,
          ),
          FormError(
            errors: errors,
          ),
          customButton(textButton: 'Sign in'),
          SizedBox(
            height: SizeConfiguration.defaultSize / 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Icon(Icons.facebook_rounded),
                  backgroundColor: Colors.grey[300],
                ),
                CircleAvatar(
                  child: SvgPicture.asset("assets/icons/google-icon.svg"),
                  backgroundColor: Colors.grey[300],
                ),
                CircleAvatar(
                  child: SvgPicture.asset("assets/icons/twitter.svg"),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfiguration.defaultSize * 0.9,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you dont have an account yet ?"),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, Register.routeName),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'GloriaHallelujah'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailField({required String label, required String hint}) {
    return TextFormField(
      onSaved: (newValue) => _email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail_outlined),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(fontFamily: 'GFSDidot', fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 5),
      ),
    );
  }

  TextFormField buildPassField({required String label, required String hint}) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
          return;
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.lock_outline),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(fontFamily: 'GFSDidot', fontSize: 12),
        enabledBorder: OutlineInputBorder(
            gapPadding: 05,
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 05,
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey)),
      ),
    );
  }

  Widget customButton({required String textButton}) {
    return InkWell(
      onTap: () {
        if (_keyForm.currentState!.validate()) {
          _keyForm.currentState!.save();
          Navigator.pushReplacementNamed(context, Browse.routeName);
        }
      },
      child: Container(
        height: 50,
        width: SizeConfiguration.defaultSize * 2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(2)),
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
/* onPressed: () {
        if (_keyForm.currentState!.validate()) {
          _keyForm.currentState!.save();
          Navigator.pushReplacementNamed(context, Home.routeName);
        }
      },*/ 