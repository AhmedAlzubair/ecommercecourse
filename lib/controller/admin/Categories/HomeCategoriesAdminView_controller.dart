import 'package:dartz/dartz_unsafe.dart';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../data/model/ItemsModel2.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';

import '../../../data/model/categoriersModel.dart';
import '../../../data/model/servesModel.dart';

abstract class HomeCategoriesController extends SearchMixController {
  initialData();
  //getdata();
  // getcat(String servId);
  // getItem();
  deletecat(int servid, String imageold);
  getdatacat();
  getdataserves();
  goToEdit(CategoriersModel servesModel);
  goTocat(String categoryid);
  goToItems(
      List<CategoriersModel> categories, int selectedCat, String categoryid);
}

class HomeCategoriesControllerImp extends HomeCategoriesController {
  MyServices myServices = Get.find();
  //late TextEditingController search;

  List<CategoriersModel> catData = [];
  List<ServesModel> serves = [];
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());
  Map catpro = {};
 HomeData homedata2 = HomeData(Get.find());
//  key => id items
//  Value => 1 OR 0

  setCatpro(id, val) {
    catpro[id] = val;
    update();
  }

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }

  @override
  getdatacat() async {
    catData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        catData.add(CategoriersModel.fromJson(servpro));
      }
   
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }

  @override
  getdataserves() async {
    serves.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataSer();
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
    getdatacat();

    super.onInit();
  }

  @override
  deletecat(int servid, String imageold) {
    var response = homedata.deleteData(servid, imageold);
    catData.removeWhere((element) => element.categoriersId == servid);

    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  @override
  goTocat( serid) {
    Get.toNamed(AppRoute.categoriesProductView, arguments: {
      "catid": serid,
      // "categories": catData,
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToEdit(CategoriersModel servesModel) {
    Get.offNamed(AppRoute.homeCategoriesAdminEdit,
        arguments: {"Categories": servesModel,"serves":serves});
  }

//   @override
//   getItem() async {
//     statusRequest = StatusRequest.loading;
//     var response = await homedata.getDataSer();
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       for (Map servpro in response['items']) {
//         itemss.add(ItemsModel2.fromJson(servpro));
//       }
//       // cat.forEach((element) {
//       //   if (element.categoriersServes == servId) {
//       //     catData.add(element);
//       //   }
//       // });
//     } else {
//       statusRequest = StatusRequest.failure;
//     }
//     // }
//     update();
//   }
// }
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
