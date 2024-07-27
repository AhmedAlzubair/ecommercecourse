import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/items_data.dart';
import 'package:ecommercecoursenmmm/data/model/ItemsModel2.dart';

import '../core/shared/searchmixController.dart';
import '../data/Model/servesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasource/remote/home_data.dart';
import '../data/model/categoriersModel.dart';

abstract class ItemsController extends SearchMixController {
  intialData();
  changeCat(int val, int catval);
  getItems(int categoryid);
  goToPageProductDetails(ItemsModel2 itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List<CategoriersModel> categories = [];
  int? catid;
  int? selectedCat;
  List<ServesModel> serves = [];
  ItemsData testData = ItemsData(Get.find());
 // HomeData homedata = HomeData(Get.find());

  String? lang;
  bool IsLang = false;

  List data = [];
  List<ItemsModel2> itemsData = [];
  List<ItemsModel2> items = [];
  StatusRequest statusRequest = StatusRequest.none;
  int priceproduct = 0;
  int discountprice=0;

  MyServices myServices = Get.find();
  getTotalPrice(String pricepro,String disco) {
    priceproduct=int.parse(pricepro);
    discountprice=int.parse(disco);

    return (priceproduct - priceproduct * discountprice! / 100).toInt() ;
  }
  @override
  void onInit() {
    search = TextEditingController();
    getcat();
    intialData();
    super.onInit();
  }

  String? userid;
  @override
  intialData() {
    userid = myServices.sharedPreferences.getString("userid");

    // serves = Get.arguments['serves'];
    // categories = Get.arguments['categories'];
    // selectedCat = Get.arguments['selectedcat'];
  }

  getcat() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData2();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        categories.add(CategoriersModel.fromJson(servpro));
      }
      catid = categories[0].categoriersId!;
      print(catid);
      getItems(catid!);
      // cat.forEach((element) {
      //   if (element.categoriersServes == servId) {
      //     catData.add(element);
      //   }
      // });
    } else {
      statusRequest = StatusRequest.failure;
    }
    // }
    update();
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(int categoryid) async {
    data.clear();
    items.clear();
    itemsData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData(userid!, categoryid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        for (Map servpro in response['items']) {
          items.add(ItemsModel2.fromJson(servpro));
        }
        items.forEach((element) {
          if (element.productCat == categoryid) {
            itemsData.add(element);
          }
        });

        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
    //}
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
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
