import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/screens/home_detail_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Yashaswi";

  get floatingActionButtonTheme => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson=
    await rootBundle.loadString("assets/files/catalog.json");
    final decodedData=jsonDecode(catalogJson);
    var productData=decodedData["products"];
    CatalogModel.items=List.from(productData)
    .map<Item>((item) => Item.fromMap(item))
    .toList();
    setState(() {});
  }
  @override

  
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
      backgroundColor: floatingActionButtonTheme,
      child: Icon(CupertinoIcons.cart,color: Colors.white,),),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
              else
               CircularProgressIndicator().centered().expand(),
                
            ]
          ,),
        ),
      )
    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            "Catalog App".text.xl5.bold.make(),
            "Trending Products".text.xl2.make(),
            ]
    );
  }
}
class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog=CatalogModel.items[index];
        return InkWell(
          onTap: () =>Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) =>HomeDetailPage(
                catalog: catalog)
                )),
          child: CatalogItem(
            catalog: catalog));
      },
    );
  }
}
class CatalogItem extends StatelessWidget {
  final catalog;
  const CatalogItem({ Key? key,@required this.catalog }) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image,)),
        Expanded(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.toString().text.bold.xl.color(MyTheme.darkBluishColor).make(),
              catalog.desc.toString().text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".toString().text.xl.bold.make(),
                  AddToCart(catalog:catalog)
                ],
              ).pOnly(right: 8.0)
            ]
        ,)
        )
        ],
      )
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

