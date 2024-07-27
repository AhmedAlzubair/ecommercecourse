import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/admin/datasource/remote/Products/homeAdminProductsData.dart';
import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';

import '../../../data/model/ItemsModel2.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/servesModel.dart';

// abstract class HomeProductsController extends SearchMixController {
//   initialData();
//   //getdata();
//   // getcat(String servId);
//   // getItem();
//   deletecat(String servid, String imageold);
//   getdatacat();

//   goToEdit(CategoriersModel servesModel);
//   goTocat(List<ServesModel> categories, int selectedCat, String categoryid);
//   goToItems(
//       List<CategoriersModel> categories, int selectedCat, String categoryid);
// }

class HomeProductsControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  //late TextEditingController search;

  List<ItemsModel2> proData = [];
  List<CategoriersModel> serves = [];
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());

  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }

  getdatapro() async {
    proData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
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

  getdatacat() async {
    serves.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataSer();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        serves.add(CategoriersModel.fromJson(servpro));
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
    // getdataserves();
    getdatapro();
    getdatacat();

    super.onInit();
  }

  deletepro(int servid, String imageold) {
      homedata.deleteData(servid, imageold);
     proData.removeWhere((element) => element.productId == servid);
   
   

    update();
  }

  goToEdit(ItemsModel2 servesModel) {
    Get.offNamed(AppRoute.homeProductsAdminEdit,
        arguments: {"items": servesModel, "categories": serves});
  }

  goToAdd() {
    Get.offNamed(AppRoute.homeProductsAdminAdd, arguments: {"catData":serves});
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
//       //     proData.add(element);
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
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());

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
