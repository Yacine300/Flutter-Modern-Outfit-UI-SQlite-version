import 'package:flutter/material.dart';
import 'package:four/data_service/db_service.dart';
import 'package:provider/provider.dart';
import 'view_models.dart/cart_view_model.dart';
import 'view_models.dart/product_view_model.dart';
import 'views/Initialisation_view/initialisation.dart';
import 'views/components/Route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider<Carts>(
          create: (context) => Carts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cornucopia plus',
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          //dialogBackgroundColor: Colors.white,
          fontFamily: 'Bodoni',
          useMaterial3: true,
        ),
        initialRoute: Initialisation.routeName,
        routes: routes,
      ),
    );
  }
}
