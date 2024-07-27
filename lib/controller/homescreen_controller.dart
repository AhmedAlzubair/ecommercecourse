import 'package:ecommercecoursenmmm/view/screen/home.dart';
import 'package:ecommercecoursenmmm/view/screen/notification.dart';
import 'package:ecommercecoursenmmm/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Services/services.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/imgaeasset.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/Model/servesModel.dart';
import '../data/datasource/remote/serves_data.dart';

import '../view/screen/cart.dart';
import '../view/screen/items.dart';
import '../view/screen/officer/officer.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

                       
  List<Widget> listPage = [
    const Items(),
    const Officer(),
    const Cart(),
   const NotificationView() ,
   const Settings()
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Free", "icon": Icons.check_box_outline_blank}, 
    {"title": "Cart", "icon": Icons.shopping_basket_outlined}, 
    {"title": "Notification", "icon": Icons.notifications_active_outlined},
    // {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];
  @override
  void onInit() {
    // serve = Get.arguments['serves'];
    // servID = Get.arguments["servid"];
    // selectedCat = Get.arguments['selectedcat'];
    //getdata();
    super.onInit();
  }


  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
