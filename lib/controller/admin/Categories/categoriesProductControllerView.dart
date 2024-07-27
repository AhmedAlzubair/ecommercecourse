import 'package:dartz/dartz_unsafe.dart';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/model/CategoriesModel2.dart';
import '../../../data/model/ItemsModel2.dart';


abstract class CategoriesProductController extends SearchMixController {
  initialData();

  getdatapro(String servid);
}

class CategoriesProductControllerImp extends CategoriesProductController {
  MyServices myServices = Get.find();
  String? serid;

    List<ItemsModel2> proData = [];
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }
    getdatapro(String catid) async {
    proData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataCat(catid);
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        proData.add(ItemsModel2.fromJson(servpro));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    serid = Get.arguments["catid"];

    // initialData();
    getdatapro(serid!);

    super.onInit();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  goToEdit(CategoriersModel servesModel) {
    Get.offNamed(AppRoute.homeCategoriesAdminEdit,
        arguments: {"Categories": servesModel});
  }
}

class SearchMixController extends GetxController {
  List<ItemsModel2> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());

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
