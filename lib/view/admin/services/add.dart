import 'package:ecommercecoursenmmm/controller/admin/services/addServiceController.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/admin/services/customButtomService.dart';
import '../../widget/admin/services/customTextFormService.dart';


class HomeServesAdminAdd extends StatelessWidget {
  const HomeServesAdminAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddServiceControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "51".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<AddServiceControllerImp>(
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
                        hinttext: "Enter Service Name",
                        // iconData: Icons.email_outlined,
                        labeltext: " Name ",
                        // mycontroller: ,
                      ),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.nameAr,
                        hinttext: "Enter Service Name (Arabic)",
                        // iconData: Icons.email_outlined,
                        labeltext: " Name (Arabic)",
                        // mycontroller: ,
                      ),
                      CustomButtomService(
                        text: "Choose Image",
                        onPressed: () {
                          Get.defaultDialog(title: "Choose Image", actions: [
                            CustomButtomService(
                              text: "Camera",
                              onPressed: () {
                                controller.chooseImageCamera();
                                Get.back();
                              },
                            ),
                            CustomButtomService(
                              text: " Gallery",
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
                        text: "Add",
                        onPressed: () {
                          controller.addServ();
                        },
                      ),
                    ])),
              ),
            )));
  }
}
