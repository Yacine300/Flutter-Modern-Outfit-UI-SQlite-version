import 'package:flutter/material.dart';
import 'package:four/Screens/Browse/Browse.dart';
import 'package:four/Screens/UpdateItem/component/update_item_screen_body.dart';
import 'package:provider/provider.dart';

import '../../Composant/SizeConfiguration.dart';
import '../../Providers/Products.dart';

class UpdateItemScreen extends StatefulWidget {
  final String? id;
  static const routeName = "update-screen";
  UpdateItemScreen({this.id});

  @override
  State<UpdateItemScreen> createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  late Products _products;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    SizeConfiguration().init(context);
    _products = Provider.of<Products>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                //  _products.deleteById(widget.id!);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Browse(),
                    ));
              },
              icon: Icon(
                Icons.delete_outline_sharp,
                color: Colors.black,
              )),
        ],
        title: Text(
          'Update',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w200,
          ),
        ),
        titleSpacing: SizeConfiguration.defaultSize,
      ),
      body: UpdateBody(
        id: widget.id!,
      ),
    );
  }
}
