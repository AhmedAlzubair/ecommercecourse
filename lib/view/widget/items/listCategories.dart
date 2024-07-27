import 'package:ecommercecoursenmmm/controller/homeCatogireyControllerImp.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/functions/translatefatabase.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../data/Model/servesModel.dart';
import '../../../data/model/categoriersModel.dart';


class ListCategoriesHome extends GetView<ItemsControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(HomeServesControllerImp());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => SizedBox(
        height: 140,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesServes(
              i: index,
              categoriesModel: controller.categories[index],
            );
          },
        ),
      ),
    );
  }
}

class CategoriesServes extends GetView<ItemsControllerImp> {
  final CategoriersModel categoriesModel;
  final int? i;
  const CategoriesServes(
      {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriersId!);
    
      },
      child: Column(
        children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
          child: FadeInImage(placeholder:AssetImage(AppImageAsset.place) ,
            image:NetworkImage("${AppLink.imagestcatss}/${categoriesModel.categoriersImage}",),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),

      ),

          Text(
            "${translateDatabase(categoriesModel.categoriersNameAr, categoriesModel.categoriersName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black,fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
