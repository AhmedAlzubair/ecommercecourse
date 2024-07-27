import 'package:ecommercecoursenmmm/controller/checkout_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/constant/imgaeasset.dart';
import 'package:ecommercecoursenmmm/view/widget/checkout/carddeliveerytype.dart';
import 'package:ecommercecoursenmmm/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommercecoursenmmm/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatefatabase.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor2,
        title:  Text('77'.tr,style:const TextStyle(color: AppColor.whiteColor),),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.primaryColor2,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child:  Text("77".tr,
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                       Text(
                        "78".tr,
                        style:const TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "79".tr,
                            isActive: controller.paymentMethod == "0" // cash
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "80".tr,
                            isActive: controller.paymentMethod == "1" // Card
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 20),
                       Text(
                        "81".tr,
                        style:const TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0");// 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.deliveryImage2,
                                title: "82".tr,
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.drivethruImage,
                                title: "83".tr,
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("2"); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.free,
                                title: "Free",
                                active: controller.deliveryType == "2"
                                    ? true
                                    : false),
                          ),

                        ],
                      ),

                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              "84".tr,
                              style:const TextStyle(
                                  color: AppColor.secondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId!);
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false),
                              ),
                            ),
                     
                          ],
                        )
                    ],
                  )))),
    );
  }
}
