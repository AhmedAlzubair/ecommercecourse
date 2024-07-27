
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/services/services.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  MyServices myServices = Get.find();
  @override
  goToPageLogin() {
    //  if (userType == "admin") {
    //           Get.offNamed(AppRoute.homeAdmin);
    //         }
    //         else{

    //         }
     Get.offAllNamed(AppRoute.loginAuth);
   
  }

  String? userType;
  @override
  void onInit() {
    // TODO: implement onInit
   // userType = myServices.sharedPreferences.getString("userType");
    super.onInit();
  }
}
