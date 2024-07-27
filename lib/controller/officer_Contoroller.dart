import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';

import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/officer_data.dart';
//import 'package:ecommercecoursenmmm/data/datasource/remote/officer_data.dart';
import 'package:ecommercecoursenmmm/data/model/ItemsModel2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/constant/routes.dart';

import '../data/model/freeProduct.dart';

class OfficerControllerImp extends SearchMixController {
  OfficerData testData = OfficerData(Get.find());
 // List<FreeProductModel> itemsData = [];
  List<ItemsModel2> itemsData = [];

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
 goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
  @override
  void onInit() {
    search = TextEditingController();
    getItems();

    super.onInit();
  }

  getItems() async {
    itemsData.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getDataOfficer();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        for (Map servpro in response['data']) {
          itemsData.add(ItemsModel2.fromJson(servpro));
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
    //}
    update();
  }
}

class SearchMixController extends GetxController {
 // List<FreeProductModel> listdata = [];
  List<ItemsModel2> listdata = [];
  StatusRequest statusRequest = StatusRequest.none;
  OfficerData homedata =OfficerData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.search(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel2.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}


























// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }
