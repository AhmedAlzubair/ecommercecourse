import 'dart:io';

import 'package:ecommercecoursenmmm/controller/admin/services/homeAdminService_controller.dart';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/data/model/servesModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';
import '../../../data/model/categoriersModel.dart';


class EditCategoriesControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());
  File? myfile;

  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }
  String? sertname;
   late int serid;
  chooseType2(int ty, String name) {
    serid = ty;
    sertname = name;
 
    update();
  }

  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  late CategoriersModel servesModel;
 
  late String catid;
  late String imageold;
  late List<ServesModel> serves;
  @override
  void onInit() {
    // TODO: implement onInit
    servesModel = Get.arguments["Categories"];
    serves = Get.arguments['serves'];
    catid = servesModel.categoriersId.toString();
    serid = servesModel.categoriersServes!;
    imageold = servesModel.categoriersImage.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    name.text = servesModel.categoriersName.toString();
    nameAr.text = servesModel.categoriersNameAr.toString();
    super.onInit();
  }

  editDataServes() async {
    if (formstate.currentState!.validate()) {
      // if (myfile == null) {
      //   Get.snackbar("warnning", "Choose Image");
      // } else {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "catid":catid.toString(),
        "id": serid.toString(),
        "name": name.text.toString(),
        "namear": nameAr.text.toString(),
        "imageold": imageold.toString()
      };
      var response = await homedata.editData(data, myfile);
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
      // }
    }
  }
}
