import 'package:flutter/material.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.black87,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: id,
              );
            },
          ),
          footer: GridTileBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
