import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
  checkoutDat(String userid,String addressid ,int pricedelivery,String deliveryType,String priceorders,String couponid,String coupondiscount,String paymentMethod ) async {
    var response = await crud.postData(AppLink.checkoutData, {
      "usersid": userid.toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": pricedelivery.toString(),
      "ordersprice": priceorders.toString(),
      "coupondiscount": couponid.toString(),
      "couponid": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
    getData(String usersid) async {
    var response =
        await crud.postData(AppLink.viewaddreessorder, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
