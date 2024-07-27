import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';
import '../../../data/model/servesModel.dart';
import '../../../data/model/ItemsModel2.dart';
abstract class HomeServiceController extends SearchMixController {
  initialData();
  deleteServ(int servid, String imageold);
  getdataserves();
  goToEdit(ServesModel servesModel);
  goTocat(List<ServesModel> servess, int selectedCat, String serid);
}

class HomeServiceAdminControllerImp extends HomeServiceController {
  MyServices myServices = Get.find();
  //late TextEditingController search;
  late String username;
  late String userid;
  late String lang;
  List<ServesModel> serves = [];
  HomeAdminServiesData homedata = HomeAdminServiesData(Get.find());

  // List data = [];
  List categories = [];
  int? selectedCat;
  String? servID;

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }

  @override
  getdataserves() async {
    serves.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['serves']) {
        serves.add(ServesModel.fromJson(servpro));
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
    // initialData();

    getdataserves();

    super.onInit();
  }

  @override
  deleteServ(int servid, String imageold) {
    var response = homedata.deleteDataserves(servid, imageold);
    serves.removeWhere((element) => element.servesId == servid);
 //getdataserves();

    update();
  }


  @override
  goTocat(servess, selectedCat, serid) {
    Get.toNamed(AppRoute.servesCategoriesAdminView, arguments: {
      "serves": servess,
      "selectedcat": selectedCat,
      "serid": serid,
      // "categories": catData,
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToEdit(ServesModel servesModel) {
    Get.offNamed(AppRoute.homeServesAdminEdit,
        arguments: {"serves": servesModel});
  }

}

class SearchMixController extends GetxController {
  List<ItemsModel2> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeAdminServiesData homedata = HomeAdminServiesData(Get.find());

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
