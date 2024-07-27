import 'package:ecommercecoursenmmm/controller/productdetails_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/view/widget/productdetails/priceandcount.dart';
import 'package:ecommercecoursenmmm/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatefatabase.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
        
    return Scaffold(
       appBar: AppBar(
        title:  Text('75'.tr,style:const TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
      ),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.primaryColor2,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child:  Text(
                  "76".tr,
                  style:const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(translateDatabase("${controller.itemsModel.productNameAr}","${controller.itemsModel.productName}"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: AppColor.fourthColor,
                                      )),
                              const SizedBox(height: 10),
                              PriceAndCountItems(
                               // controller: controller.countpro,
                                  onAdd: () {
                                    controller.add();
                                  },
                                  onRemove: () {
                                    controller.remove();
                                  },
                                  price:
                                      "${controller.getTotalPrice(controller.itemsModel.productPrice!, controller.itemsModel.productDiscount!)} RS",
                                 //controller.countitems
                                  count: "${controller.countitems}"),
                              const SizedBox(height: 10),
                              Text(      translateDatabase(
                                  controller.itemsModel.productNameAr, controller.itemsModel.productName),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: AppColor.grey2)),
                              const SizedBox(height: 10),
                            
                            ]),
                      ))
                ])));
  }
}
