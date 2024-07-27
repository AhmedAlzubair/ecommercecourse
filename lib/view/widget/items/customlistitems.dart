import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecoursenmmm/controller/favorite_controller.dart';
import 'package:ecommercecoursenmmm/controller/items_controller.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/constant/imgaeasset.dart';
import 'package:ecommercecoursenmmm/core/functions/translatefatabase.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/ItemsModel2.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel2 itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                   // mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.productId}",
                        child: 

              FadeInImage(placeholder:const AssetImage(AppImageAsset.place) ,
               image:NetworkImage("${AppLink.imagestProduct}/${itemsModel.productImage}",),
                width: double.infinity,
                height: 150,
                fit: BoxFit.fill,
               ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Text(
                            translateDatabase(
                                itemsModel.productNameAr, itemsModel.productName),
                            style: const TextStyle(
                                color: AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          maxLines:1,
                          softWrap: true,
                          overflow:TextOverflow.clip ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Rating 3.5 ", textAlign: TextAlign.center),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 22,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      5,
                                      (index) => const Icon(
                                            Icons.star,
                                            size: 10,
                                          ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           RichText(
                             text:TextSpan(
                                 text: "${controller.getTotalPrice(itemsModel.productPrice!, itemsModel.productDiscount!)} RS",
                                 style:const  TextStyle(
                                     color: AppColor.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: "sans")
                             ), ),
                            RichText(
                              text:TextSpan(
                                  text: "${itemsModel.productPrice} SR",
                                  style: const TextStyle(
                                      color: AppColor.primaryColor2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                     decorationColor:AppColor.black,
                                      fontFamily: "sans")
                              ),

                                ),
                            // Text("${itemsModel.productPrice} RS",
                            //     style: const TextStyle(
                            //         color: AppColor.primaryColor,
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.bold,
                            //         fontFamily: "sans")),
                            GetBuilder<FavoriteController>(
                                builder: (controller) => IconButton(
                                    onPressed: () {
                                      if (controller.isFavorite[itemsModel.productId] ==
                                          "1") {
                                        controller.setFavorite(
                                            itemsModel.productId, "0");
                                        controller
                                            .removeFavorite(itemsModel.productId!);

                                      } else {
                                        controller.setFavorite(
                                            itemsModel.productId, "1");
                                        controller.addFavorite(itemsModel.productId!);

                                      }
                                    },
                                    icon: Icon(
                                      controller.isFavorite[itemsModel.productId] == "1"
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: AppColor.primaryColor,
                                    )))
                          ],
                        ),
                      )
                    ]),
              ),
           // if (itemsModel.productDiscount!= "0")   Positioned(
           //      top: 4,
           //      left: 4,
           //      child: Image.asset(AppImageAsset.saleOne , width: 40,))
            ],
          ),
        ));
  }
}






























// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))