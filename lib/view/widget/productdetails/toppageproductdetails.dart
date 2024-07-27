import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecoursenmmm/controller/productdetails_controller.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.primaryColor2),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.productId}",
              child: Image.network(
               
                    "${AppLink.imagestProduct}/${controller.itemsModel.productImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),

            ))
      ],
    );
  }
}
