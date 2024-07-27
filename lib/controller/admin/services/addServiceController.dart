import 'dart:io';

import 'package:ecommercecoursenmmm/controller/admin/services/homeAdminService_controller.dart';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';
import '../../../view/admin/services/view.dart';

class AddServiceControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminServiesData homedata = HomeAdminServiesData(Get.find());
  File? myfile;
  
  chooseImage()async {
    myfile =await chooseImagePickerGallery();
    update();
  }
  chooseImageCamera()async {
    myfile =await chooseImagePickerCamera();
    update();
  }

  late TextEditingController name;
  late TextEditingController nameAr;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    // TODO: implement onInit
    name = TextEditingController();
    nameAr = TextEditingController();
    super.onInit();
  }

  addServ() async {
    if (formstate.currentState!.validate()) {
      if (myfile == null){  Get.snackbar("warnning", "Choose Image");}
      else{
          statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text.toString(), "namear": nameAr.text.toString()};
      var response = await homedata.addDataserves(data, myfile);
      print("====================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.homeServesAdminView);
          // HomeServiceAdminControllerImp serv = Get.find();
          // serv.getdataserves();
        }
      } else {}
      update();
    }
      }
    
  }
}
