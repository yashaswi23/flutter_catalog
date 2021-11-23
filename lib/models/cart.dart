import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
  //singleton class
  

  late CatalogModel _catalog;
  final List <int> _itemIds=[];
  CatalogModel get catalog=>_catalog;
  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }
  //Get items in the cart
  List<Item>get items=>_itemIds.map((id) => _catalog.getByID(id)).toList();
  //Get the total price
  num get totalPrice=>items.fold(0, (total, current) => total+current.price);
  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }
  //remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}
class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }

}