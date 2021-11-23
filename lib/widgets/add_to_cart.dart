import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  final catalog;
   AddToCart( {
    Key? key, this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[AddMutation,RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    //final CatalogModel _catalog=(VxState.store as MyStore).catalog;
    bool isInCart=_cart.items.contains(catalog) ??false;
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
        //isInCart=isInCart.toggle();
        //final _catalog=CatalogModel();
          //_cart.catalog=_catalog;
          AddMutation(catalog);
        //setState(() {} );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyTheme.darkBluishColor,
        ),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
       child:isInCart ? Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus));
  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({ Key? key,required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.color(context.canvasColor ).make().p16().w40(context);
  }
}
