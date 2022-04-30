import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Theme.of(context).primaryColor,),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Theme.of(context).errorColor,),
          ],
        ),
      ),
    );
  }
}