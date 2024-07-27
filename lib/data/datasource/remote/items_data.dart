import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String usersid, int itemsid) async {
    var response = await crud.postData(AppLink.itemsview3, 
    {"userid": usersid.toString(), "productid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getData2() async {
    var response = await crud.postData(AppLink.catview, 
    {});
    return response.fold((l) => l, (r) => r);
  }
}
