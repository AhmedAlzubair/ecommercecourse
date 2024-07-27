import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/Model/servesModel.dart';
import '../data/datasource/remote/serves_data.dart';

class ServesController extends GetxController {
  ServesDataa homedata = ServesDataa(Get.find());
  MyServices myServices = Get.find();
  //late TextEditingControllACer search;
  List<ServesModel> serves = [];
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    //search = TextEditingController();
    // lang = myServices.sharedPreferences.getString("lang");

    getdata();
    super.onInit();
  }

  getdata() async {
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

  goToItems(categories, selectedCat, servid) {
    Get.offNamed(AppRoute.homepage, arguments: {
      "serves": categories,
      "selectedcat": selectedCat,
      "servid": servid,
    });
  }
}
