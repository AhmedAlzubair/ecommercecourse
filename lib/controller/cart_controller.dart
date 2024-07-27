import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/cart_data.dart';
import 'package:ecommercecoursenmmm/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/cartModel2.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());

  int? discountcoupon = 0;

  String? couponname;

  String? couponid;
  int priceproduct = 0;
  int discountprice=0;
  int total=0;
  getPrice(String pricepro,String disco) {
    priceproduct=int.parse(pricepro);
    discountprice=int.parse(disco);
    return (priceproduct - priceproduct * discountprice! / 100) ;
  }

   StatusRequest statusRequest=StatusRequest.none;

  CouponModel? couponModel;

  MyServices myServices = Get.find();

  List<CartModel2> cart = [];
  double priceorders = 0.0;

  int totalcountitems = 0;
  String? userid;
  add(int itemsid) async {
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await cartData.addCart(userid!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            duration:const Duration(seconds: 1),
            messageText: const Text("تم اضافة المنتج الى السلة "));

        //  for(Map dataresponse in response['data'] ){
        //    cart.add( CartModel2.fromJson(dataresponse));
        //  }
        // cart.addAll(dataresponse.map((e) => CartModel2.fromJson(e)));
        //cart.addAll();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCheckout() {
    if (cart.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  getTotalPrice() {
    
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  delete(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(userid!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            duration:const Duration(seconds: 1),
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount.toString());
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Warning", "Coupon Not Valid",duration:const Duration(seconds: 1));
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    cart.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  remove(int proid) {

      delete(proid);
       refreshPage();
      //update();
    
  }

  addCard(int proid) {
    add(proid);
    refreshPage();
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(userid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        //if (response['datacart']['status'] == 'success') {
        List dataresponse = response['datacart'];
        Map dataresponsecountprice = response['countprice'];
        // data.clear();
        cart.addAll(dataresponse.map((e) => CartModel2.fromJson(e)));
        totalcountitems = int.parse(dataresponsecountprice['totalcount'].toString());
        priceorders = double.parse(dataresponsecountprice['totalprice'].toString());
        print(priceorders);
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  view2() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(userid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        //if (response['datacart']['status'] == 'success') {
        List dataresponse = response['datacart'];
        Map dataresponsecountprice = response['countprice'];
        // data.clear();
        cart.addAll(dataresponse.map((e) => CartModel2.fromJson(e)));
        totalcountitems = int.parse(dataresponsecountprice['totalcount']);
        priceorders = double.parse(dataresponsecountprice['totalprice']);
        print(priceorders);
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    userid = myServices.sharedPreferences.getString("userid")!;
    view();
    super.onInit();
  }
}
