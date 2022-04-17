import 'package:flutter/material.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Lato',
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 12,color: Colors.white,)

        )
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
