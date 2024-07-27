

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';

import '../../../data/admin/datasource/remote/organization/homeAdminOrgenizationData.dart';
import '../../../data/model/ItemsModel2.dart';
import '../../../data/model/organizationModel.dart';
import '../../../data/model/servesModel.dart';




// abstract class HomeOrganizationController extends SearchMixController {
//   initialData();
//   deleteServ(String servid, String imageold);
//   getdataserves();
//   goToEdit(OrganizationModel servesModel);
//   //goTocat(List<ServesModel> servess, int selectedCat, String serid);
// }

class HomeOrganizationAdminControllerImp extends GetxController {
  MyServices myServices = Get.find();
  //late TextEditingController search;
  late String username;
  late String userid;
  late String lang;
  List<OrganizationModel> serves = [];
  HomeAdminOrganizationData homedata = HomeAdminOrganizationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  List categories = [];
  int? selectedCat;
  String? servID;

  


  getdataserves() async {
    serves.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        serves.add(OrganizationModel.fromJson(servpro));
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
   // search = TextEditingController();
    // initialData();

    getdataserves();

    super.onInit();
  }


  deleteServ(int servid, String imageold) {
    var response = homedata.deleteDataserves(servid, imageold);
    serves.removeWhere((element) => element.orgenizationId == servid);

    update();
  }

  goToAdd() {
    Get.offNamed(AppRoute.addressAddOrganization);
  }





  goToEdit(OrganizationModel servesModel) {
    Get.offNamed(AppRoute.homeOrgenizationAdminEdit,
        arguments: {"orgenization": servesModel});
  }

}
