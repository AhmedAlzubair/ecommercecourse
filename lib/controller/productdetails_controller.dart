import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/cart_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/ItemsModel2.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  //CartController cartController = Get.put(CartController());
  late ItemsModel2 itemsModel;

  CartData cartData = CartData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  String? userid;
  int countitems = 0;
  int priceproduct = 0;
  int discountprice=0;
  getTotalPrice(String pricepro,String disco) {
    priceproduct=int.parse(pricepro);
    discountprice=int.parse(disco);
    return (priceproduct - priceproduct * discountprice! / 100).toInt() ;
  }

  intialData() async {
    userid = myServices.sharedPreferences.getString("userid")!;
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.productId!);
    // countpro.text = countitems.toString();
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountCart(userid!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response['data'];
        //int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  addItems(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    //int total = countitems + int.parse(countpro.text);
    // print(total);
    var response = await cartData.addCart(userid!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "),
            duration: const Duration(seconds: 1));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  addItems2(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    //int total = countitems + int.parse(countpro.text);
    // print(total);
    var response = await cartData.addCart2(userid!, itemsid,countitems);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "),
            duration: const Duration(seconds: 1));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteitems(int itemsid) async {
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
            messageText: const Text("تم ازالة المنتج من السلة "),
            duration: const Duration(seconds: 1));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  add() {
    addItems(itemsModel.productId!);
    //countitems = await getCountItems(itemsModel.productId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
       deleteitems(itemsModel.productId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
