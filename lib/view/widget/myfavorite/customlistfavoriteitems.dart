import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecoursenmmm/controller/favorite_controller.dart';
import 'package:ecommercecoursenmmm/controller/items_controller.dart';
import 'package:ecommercecoursenmmm/controller/myfavoritecontroller.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/functions/translatefatabase.dart';

import 'package:ecommercecoursenmmm/data/model/myfavorite.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/imgaeasset.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  // final bool active;
  const CustomListFavoriteItems({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
           //controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
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
                      fit: BoxFit.cover,
                    ),
              
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text(
                        translateDatabase(
                            itemsModel.productNameAr, itemsModel.productName),
                        style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                  Row(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${itemsModel.productPrice} SR",
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans")),
                        IconButton(
                            onPressed: () {
                                controller.deleteFromFavorite(itemsModel.favoriteId!) ;
                            },
                            icon:const Icon(
                              Icons.delete_outline_outlined,
                              color: AppColor.primaryColor,
                            ))
                      ],
                    ),
                  )
                ]),
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