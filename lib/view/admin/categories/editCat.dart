
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Categories/editCategoriesController.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/admin/services/customButtomService.dart';
import '../../widget/admin/services/customTextFormService.dart';


class HomeCategoriesAdminEdit extends StatelessWidget {
  const HomeCategoriesAdminEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoriesControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "38".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor2),
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<EditCategoriesControllerImp>(
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
                        hinttext: "39".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "40".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.nameAr,
                        hinttext: "41".tr,
                        // iconData: Icons.email_outlined,
                        labeltext: "42".tr,
                        // mycontroller: ,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "43".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColor.primaryColor2,
                                    fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                                items: [
                                  ...List.generate(
                                      controller.serves.length,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                              "${translateDatabase(controller.serves[index].servesNameAr, controller.serves[index].servesName)}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: AppColor.black),
                                            ),
                                            onTap: () {
                                              controller.chooseType2(
                                                  controller
                                                      .serves[index].servesId!,
                                                  translateDatabase(
                                                      controller.serves[index]
                                                          .servesNameAr,
                                                      controller.serves[index]
                                                          .servesName));
                                            },
                                            value:translateDatabase(
                                                      controller.serves[index]
                                                          .servesNameAr,
                                                      controller.serves[index]
                                                          .servesName)
                                              ,
                                          ))
                                ],
                                value:  controller.sertname,
                                onChanged: (val) {
                                 // controller.chooseType(val!);
                                }),
                          )
                        ],
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
