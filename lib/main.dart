import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/Carts.dart';
import 'Providers/Products.dart';
import 'Screens/Initialisation/initialisation.dart';
import 'Composant/Route.dart';

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
