
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Products/editProductsController.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/admin/services/customButtomService.dart';
import '../../widget/auth/customtextformauth.dart';

class HomeProductsAdminEdit extends StatelessWidget {
  const HomeProductsAdminEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProductsControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "56".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<EditProductsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                     
                        CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.name,
                        hinttext: "49".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      
                        CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.nameAr,
                        hinttext: "51".tr,
                        iconData: Icons.person_2_outlined,
                        labeltext: "50".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 200, "");
                        },
                        mycontroller: controller.desc,
                        hinttext: "52".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "53".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 200, "");
                        },
                        mycontroller: controller.descar,
                        hinttext: "54".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "53".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 1, 11, "");
                        },
                        mycontroller: controller.count,
                        hinttext: "66".tr,
                        iconData: Icons.countertops_outlined,
                        labeltext: "68".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 1, 11, "");
                        },
                        mycontroller: controller.price,
                        hinttext: "67".tr,
                        iconData: Icons.price_check_outlined,
                        labeltext: "69".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 1, 11, "");
                        },
                        mycontroller: controller.discount,
                        hinttext: "70".tr,
                        iconData: Icons.discount_outlined,
                        labeltext: "71".tr,
                        // mycontroller: ,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "40".tr,
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
                                      controller.proData.length,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                              "${translateDatabase(controller.proData[index].categoriersNameAr, controller.proData[index].categoriersName)}",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: AppColor.black),
                                            ),
                                            onTap: () {
                                              controller.chooseType2(
                                                  controller.proData[index]
                                                      .categoriersId!,
                                                  translateDatabase(
                                                      controller.proData[index]
                                                          .categoriersNameAr,
                                                      controller.proData[index]
                                                          .categoriersName));
                                            },
                                            value:
                                                "${translateDatabase(
                                                      controller.proData[index]
                                                          .categoriersNameAr,
                                                      controller.proData[index]
                                                          .categoriersName)}",
                                          ))
                                ],
                              
                                onChanged: (val) {
                                 // controller.chooseType(val!);
                                },
                                value: controller.sertname,
                                ),
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
                              text: " 46".tr,
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
