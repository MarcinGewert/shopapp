import 'package:flutter/material.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
 // final String id;
 // final String title;
 // final String imageUrl;
//
 // ProductItem(
 //   this.id,
 //   this.title,
 //   this.imageUrl,
 // );

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context, listen: false,);
    final cart = Provider.of<Cart>(context);
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
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: product.id,
              );
            },
          ),
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border,),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Theme.of(context).accentColor,
              ),

            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title,);
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
