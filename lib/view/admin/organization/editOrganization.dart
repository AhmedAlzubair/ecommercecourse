
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/admin/organization/editorganizationController.dart';
import '../../../controller/admin/services/editServiceController.dart';
import '../../../core/class/handlingdataview.dart';

import '../../../core/functions/validinput.dart';
import '../../widget/admin/services/customButtomService.dart';
import '../../widget/admin/services/customTextFormService.dart';


class HomeOrganizationAdminEdit extends StatelessWidget {
  const HomeOrganizationAdminEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditOrganizationControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "58".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<EditOrganizationControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.name,
                        hinttext: "60".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.nameAr,
                        hinttext: "61".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.city,
                        hinttext: "62".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.cityAr,
                        hinttext: "63".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.street,
                        hinttext: "64".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      CustomButtomService(
                        text: "44".tr,
                        onPressed: () {
                          Get.defaultDialog(title: "44".tr, actions: [
                            CustomButtomService(
                              text: "45".tr,
                              onPressed: () {
                                controller.chooseImageCamera();
                                Get.back();
                              },
                            ),
                            CustomButtomService(
                              text: "46".tr,
                              onPressed: () {
                                controller.chooseImage();
                                 Get.back();
                              },
                            ),
                          ]);
                        },
                        myfile: controller.myfile == null ? false : true,
                      ),
                      CustomButtomService(
                        text: "48".tr,
                        onPressed: () {
                          controller.editDataServes();
                        },
                      ),
                    ])),
              ),
            )));
  }
}
