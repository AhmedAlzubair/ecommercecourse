
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommercecoursenmmm/controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/Model/servesModel.dart';
import '../../../linkapi.dart';

class Restorants extends GetView<HomeControllerImp> {
   const Restorants({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return  GridView.builder(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
            itemCount: controller.serves.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) => ListRestorantsHome(
                  i: index,
                  categoriesModel: controller.serves[index],
                ),
      
    );
  }
}

class ListRestorantsHome extends GetView<HomeControllerImp> {
  final ServesModel categoriesModel;
  final int i;
  const ListRestorantsHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTocat(controller.serves, i, categoriesModel.servesId);
      },
      child: Card(
        margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             // Placeholder()
            // FadeInImage.assetNetwork(placeholder: "${AppImageAsset.restaruant}", image:  "${AppLink.imagestService}/${categoriesModel.servesImage}"),
              // Image.network(
              //   "${AppLink.imagestService}/${categoriesModel.servesImage}",
              //   width: 200,
              //   height: 150,
              // ),
                CachedNetworkImage(
                          imageUrl:
                "${AppLink.imagestService}/${categoriesModel.servesImage}",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
             SizedBox(height: 20,),
             // Text(categoriesModel.servesName!),
              Text(
            "${translateDatabase(categoriesModel.servesNameAr, categoriesModel.servesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
            ]),
      ),
    );
  }
}
