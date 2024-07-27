import 'package:ecommercecoursenmmm/controller/address/add_controller.dart';
import 'package:ecommercecoursenmmm/controller/address/adddetails_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/shared/custombutton.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/custombuttonauth.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('65'.tr),
      ),
      body: Container(
          padding:const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "62".tr,
                      labeltext: "50".tr,
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "64".tr,
                      labeltext: "50".tr,
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "60".tr,
                      labeltext: "50".tr,
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  CustomButton(
                    text: "47".tr,
                    onPressed: () {
                      controller.addAddress() ; 
                    },
                  )
                ])),
          )),
    );
  }
}
