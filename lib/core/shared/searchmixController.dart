import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/home_data.dart';
import '../../data/model/ItemsModel2.dart';
import '../class/statusrequest.dart';
import '../functions/handingdatacontroller.dart';

class SearchMixController extends GetxController {
  List<ItemsModel2> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homedata =HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
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