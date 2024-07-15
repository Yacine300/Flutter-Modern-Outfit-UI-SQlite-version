import 'package:flutter/material.dart';
import 'package:four/views/browse_view/Browse.dart';
import 'package:four/views/update_item_view/component/update_item_screen_body.dart';
import 'package:provider/provider.dart';

import '../components/SizeConfiguration.dart';
import '../../view_models.dart/product_view_model.dart';

class UpdateItemScreen extends StatefulWidget {
  final String? id;
  static const routeName = "update-screen";
  UpdateItemScreen({this.id});

  @override
  State<UpdateItemScreen> createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  late Products products;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfiguration().init(context);
    products = Provider.of<Products>(context);
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
