import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/class/statusrequest.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/chooseImage.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/admin/datasource/remote/organization/homeAdminOrgenizationData.dart';
import '../../../data/model/organizationModel.dart';
import '../../../data/model/servesModel.dart';




class EditOrganizationControllerImp extends GetxController {
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

  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController cityAr = TextEditingController();
  TextEditingController street = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  late OrganizationModel servesModel;
  late String serid;
  late String imageold;

  @override
  void onInit() {
    // TODO: implement onInit
    servesModel = Get.arguments["orgenization"];
    serid = servesModel.orgenizationId.toString();
    imageold = servesModel.orgenizationImage.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    name.text = servesModel.orgenizationName.toString();
    nameAr.text = servesModel.orgenizationNameAr.toString();
    city.text = servesModel.orgenizationCity.toString();
    cityAr.text = servesModel.orgenizationCityAr.toString();
    street.text = servesModel.orgenizationStreet.toString();
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
        "id": serid.toString(),
        "name": name.text,
        "namear": nameAr.text,
        "city": city.text,
        "cityar": cityAr.text,
        "street": street.text,
        "imageold": imageold
      };
      var response = await homedata.editDataSer(data, myfile);
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

