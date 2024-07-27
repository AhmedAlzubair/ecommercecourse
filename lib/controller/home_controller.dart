import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/home_data.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/Model/servesModel.dart';

abstract class HomeController extends SearchMixServeController {
  initialData();

  getdataserves();
 // goTocat(List<ServesModel> categories, int selectedCat, int categoryid);

}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late String lang;
  List<ServesModel> serves = [];
  HomeData homedata = HomeData(Get.find());

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang")!;

  }

  @override
  getdataserves() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataserves();
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
   lang = myServices.sharedPreferences.getString("lang")!;
    getdataserves();

    super.onInit();
  }



  // @override
  goTocat(categories, selectedCat, categoryid) {

    Get.toNamed(AppRoute.homeCategoriers, arguments: {
      "serves": categories,
      "selectedcat": selectedCat,
      "serid": categoryid,
      // "categories": catData,
    });
  }

}
class SearchMixServeController extends GetxController {
  List<ServesModel> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ServesModel.fromJson(e)));
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

