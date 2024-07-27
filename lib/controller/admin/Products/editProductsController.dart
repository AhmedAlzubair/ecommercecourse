import 'dart:io';
import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/Products/homeAdminProductsData.dart';

import '../../../data/model/ItemsModel2.dart';
import '../../../data/model/categoriersModel.dart';

class EditProductsControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());
  File? myfile;
  int? catid;
  String? sertname;
  List<CategoriersModel> proData = [];
  chooseType2(int ty, String name) {
    catid = ty;
    sertname = name;
    update();
  }

  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

  chooseType(int ty) {
    catid = ty;
    //sertype = serves[ty].servesName;
    print("====================================$catid");
    update();
  }

  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController descar = TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController active = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  //TextEditingController catid = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  late ItemsModel2 productModel;
  late int proid;
  //late List<ItemsModel2> serves;
  List<CategoriersModel> catData = [];
  late String imageold;
  @override
  void onInit() {
    //getdatacat();
    // TODO: implement onInit
    productModel = Get.arguments["items"];
    proData = Get.arguments["categories"];
    proid = productModel.productId!;
    catid = productModel.categoriersId;
    imageold = productModel.productImage.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    name.text = productModel.productName.toString();
    nameAr.text = productModel.productNameAr.toString();
    desc.text = productModel.productDesc.toString();
    descar.text = productModel.productDescAr.toString();
    count.text = productModel.productCount.toString();
    price.text = productModel.productPrice.toString();
    discount.text = productModel.productDiscount.toString();
    active.text = productModel.productActive.toString();
    //sertname=productModel.categoriersName.toString();

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
        "id": proid.toString(),
        "name": name.text,
        "namear": nameAr.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text.toString(),
        "active": active.text.toString(),
        "price": price.text.toString(),
        "discount": discount.text.toString(),
        "catid": catid.toString(),     
        "imageold": imageold
      };
      var response = await homedata.editData(data, myfile);
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
      // }
    }
  }

  getdatacat() async {
    proData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataSer();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['categories']) {
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
