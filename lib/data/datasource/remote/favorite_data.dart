import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, int itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"userid": usersid.toString(), "productid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, int itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"userid": usersid.toString(), "productid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
    getData(int id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
