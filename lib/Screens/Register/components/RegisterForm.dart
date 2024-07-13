import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four/Screens/Browse/Browse.dart';
import '../../../Composant/Constant.dart';
import '../../../Composant/SizeConfiguration.dart';

import '../../Sign_In/Sign_in_screen.dart';
import 'FormError.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
          SizedBox(height: SizeConfiguration.defaultSize / 3),
          buildPassField(label: 'Password', hint: '******'),
          SizedBox(
            height: SizeConfiguration.defaultSize / 3,
          ),
          buildPassField(label: 'Confirm Password', hint: '******'),
          SizedBox(
            height: SizeConfiguration.defaultSize / 3,
          ),
          FormError(
            errors: errors,
          ),
          customButton(textButton: 'Register'),
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
            height: SizeConfiguration.defaultSize,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("do have an accoungt on cornucopia ?"),
                InkWell(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, SignIn.routeName),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontFamily: 'GloriaHallelujah',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
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
        suffixIcon: Icon(Icons.mail_outline),
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
            borderRadius: BorderRadius.circular(2), color: Colors.black),
        child: Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
