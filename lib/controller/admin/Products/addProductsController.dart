import 'dart:io';

import 'package:ecommercecoursenmmm/controller/admin/services/homeAdminService_controller.dart';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/Products/homeAdminProductsData.dart';
import '../../../data/model/ItemsModel2.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/servesModel.dart';

class AddProductsControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());
  File? myfile;
  List<ItemsModel2> serves = [];
  List<CategoriersModel> proData = [];
  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

  String? serty;
  changeType(String type) {
    serty = type;
    update();
  }

  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController active;
  late TextEditingController price;
  late TextEditingController discount;
  //TextEditingController catid = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  int? catid;
  String? sertname;
  chooseType(int ty) {
    catid = ty;
  
    update();
  }

  chooseType2(int ty, String name) {
    catid = ty;
    sertname = name;
    //sertype = serves[ty].servesName;
 
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    active = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
   // serves = Get.arguments["items"];
    proData = Get.arguments["catData"];
    //getdataserves();
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
          "name": name.text.toString(),
          "namear": nameAr.text.toString(),
          "desc": desc.text.toString(),
          "descar": descar.text.toString(),
          "count": count.text.toString(),
        // "imageold": pr.toString(),
          "price": price.text.toString(),
          "discount": discount.text.toString(),
          "catid": catid.toString(),
          // "type":sertname.toString()
        };
        var response = await homedata.addData(data, myfile);
        print("====================$response");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.homeProductsAdminView);
            // HomeServiceAdminControllerImp serv = Get.find();
            // serv.getdataserves();
          }
        } else {}
        update();
      }
    }
  }

  getdataserves() async {
    proData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataSer();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        proData.add(CategoriersModel.fromJson(servpro));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }
}
