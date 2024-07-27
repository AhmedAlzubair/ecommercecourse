import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart2(String usersid, int itemsid,int productcount) async {
    var response = await crud
        .postData(AppLink.cartadd, {"usersid": usersid.toString(), "itemsid": itemsid.toString(),"productcount":productcount.toString()});
    return response.fold((l) => l, (r) => r);
  }
  addCart(String usersid, int itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }


  deleteCart(String usersid, int itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, int itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {
      "usersid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  viewCart2(String usersid ,String proid) async {
    var response = await crud.postData(AppLink.cartview2, {
      "usersid": usersid.toString(),
      "productid":proid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponname.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
