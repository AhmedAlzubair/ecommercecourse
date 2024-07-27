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
import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';
import '../../../view/admin/services/view.dart';

class EditServiceControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminServiesData homedata = HomeAdminServiesData(Get.find());
  File? myfile;

  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

   TextEditingController name=TextEditingController();
   TextEditingController nameAr=TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  late ServesModel servesModel;
  late String serid;
  late String imageold;
  @override
  void onInit() {
    // TODO: implement onInit
    servesModel = Get.arguments["serves"];
    serid = servesModel.servesId.toString();
    imageold = servesModel.servesImage.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    name.text = servesModel.servesName.toString();
    nameAr.text = servesModel.servesNameAr.toString();
    super.onInit();
  }

  editDataServes() async {
    if (formstate.currentState!.validate()) {
      // if (myfile == null) {
      //   Get.snackbar("warnning", "Choose Image");
      // } else {
        statusRequest = StatusRequest.loading;
        update();
        Map data = {"id":serid,"name": name.text.toString(), "namear": nameAr.text.toString(),"imageold":imageold};
        var response = await homedata.editDataSer(data, myfile);
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
     // }
    }
  }
}
