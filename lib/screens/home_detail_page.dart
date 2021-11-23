import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({ Key? key, required this.catalog }) : assert(catalog!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".toString().text.xl4.red800.bold.make(),
                    AddToCart(catalog:catalog).wh(120, 50)
                  ],
                ).p32(),
      ),
      
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                 tag: Key(catalog.id.toString()),
                 child: Image.network(catalog.image)
                 ),
                Container(
                   color: Colors.white,
                   child: Column(
                     children: [
                       catalog.name.toString().text.bold.xl5.color(MyTheme.darkBluishColor).make(),
                       catalog.desc.toString().text.xl.make(),
                       10.heightBox,
                       "Tempor nonumy diam eos ea amet at eos, eirmod sea et eirmod diam sanctus sadipscing et invidunt. Est ipsum sed amet ut sanctus eirmod diam lorem amet. Sadipscing vero takimata sit sit elitr ipsum ipsum, amet diam et eirmod no diam ea diam nonumy, no ipsum diam dolore sea. Lorem."
                       .text.make().p16(),
                     ],
                   ).py64().expand()
                 )
            ],
          ).p16(),
        ),
      ),
    );
  }
}