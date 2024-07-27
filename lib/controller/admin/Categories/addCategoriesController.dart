import 'dart:io';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/model/servesModel.dart';

class AddCategoriesControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());
  File? myfile;
  List<ServesModel> serves = [];
  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

  int? serty;
 
  
  String? sertname;
  chooseType2(int ty, String name) {
    serty = ty;
    sertname = name;
 
    update();
  }

  late TextEditingController name;
  late TextEditingController nameAr;
  StatusRequest statusRequest = StatusRequest.none;
  String? serid;
  String? sertype;
  chooseType(String ty) {
    serid = ty;
    //sertype = serves[ty].servesName;
    print("====================================$serid");
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    name = TextEditingController();
    nameAr = TextEditingController();
    getdataserves();
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
          "id": serty.toString(),
          "name": name.text,
          "namear": nameAr.text,
          
          // "type": sertype.toString()
        };
        var response = await homedata.addData(data, myfile);
        print("====================$response");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.homeCategoriesAdminView);
            // HomeServiceAdminControllerImp serv = Get.find();
            // serv.getdataserves();
          }
        } else {}
        update();
      }
    }
  }

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
}
