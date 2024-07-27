import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  String username="UserName";
  logout() {
    String userid = myServices.sharedPreferences.getString("userid")!;
    
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.onBoarding);
  }
  @override
  void onInit() {
    // TODO: implement onInit
     username = myServices.sharedPreferences.getString("username")!;
    super.onInit();
  }
}
