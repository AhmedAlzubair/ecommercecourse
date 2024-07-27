import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/chooseImage.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/admin/datasource/remote/organization/homeAdminOrgenizationData.dart';

class AddOrganizationControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminOrganizationData homedata = HomeAdminOrganizationData(Get.find());
  File? myfile;

  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController city;
  late TextEditingController city_ar;
  late TextEditingController street;

  StatusRequest statusRequest = StatusRequest.none;
  String? lat, lot;
  @override
  void onInit() {
    // TODO: implement onInit
    lat = Get.arguments['lat'];
    lot = Get.arguments['long'];
    name = TextEditingController();
    nameAr = TextEditingController();
    city = TextEditingController();
    city_ar = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  addServ() async {
    if (formstate.currentState!.validate()) {
      if (myfile == null) {
        Get.snackbar("warnning", "Choose Image");
      } else {
        statusRequest = StatusRequest.loading;
        update();
        Map data = {
          "name": name.text,
           "namear": nameAr.text,
           "city":city.text,
           "cityar":city_ar.text,
           "street":street.text,
           "lat":lat,
           "long":lot
           };
        var response = await homedata.addDataserves(data, myfile);
        print("====================$response");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.homeOrgenizationAdminView);
            // HomeServiceAdminControllerImp serv = Get.find();
            // serv.getdataserves();
          }
        } else {}
        update();
      }
    }
  }
}
