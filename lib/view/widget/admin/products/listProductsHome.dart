
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecoursenmmm/data/model/ItemsModel2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/admin/Products/HomeProductsAdminView_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imgaeasset.dart';
import '../../../../core/functions/translatefatabase.dart';

import '../../../../linkapi.dart';


class ListProductsAdminHome
    extends GetView<HomeProductsControllerImp> {
  final ItemsModel2 categoriesModel;
  final int i;
  const ListProductsAdminHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // controller.goTocat(controller.serves, i, categoriesModel.servesId!);
      },
      child: Card(
        //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.network(
              //   "${AppLink.imagestProduct}/${categoriesModel.productImage}",
              //   width: 200,
              //   height: 150,
              // ),
                            FadeInImage(placeholder:AssetImage(AppImageAsset.place) ,
               image:NetworkImage("${AppLink.imagestProduct}/${categoriesModel.productImage}",),
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
               ),
              //  CachedNetworkImage(
              //             imageUrl:
              //    "${AppLink.imagestProduct}/${categoriesModel.productImage}",
              //   width: double.infinity,
              //   height: 150,
              //   fit: BoxFit.cover,
              // ),
              //const SizedBox(height: 20,),
              // Text(categoriesModel.servesName!),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: Text(
                  "${translateDatabase(categoriesModel.productNameAr, categoriesModel.productName)}",
                  style: const TextStyle(fontSize: 13, color: AppColor.black),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                  
                         IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          controller.goToEdit(categoriesModel);
                        }),
                          IconButton(
                        icon: const Icon(Icons.delete_outline_outlined),
                        onPressed: () {
                          controller.deletepro(categoriesModel.productId!,
                              categoriesModel.productImage.toString());
                        }),
                  ],
                ),
              )
              //  ListTile(
              //   title: Text(
              //                    "${translateDatabase(categoriesModel.servesNameAr, categoriesModel.servesName)}",
              //                    style: const TextStyle(fontSize: 18, color: AppColor.black),
              //                  ),
              //                  leading: IconButton(icon:const Icon(Icons.delete_outline_outlined),onPressed: () {}),
              //                  trailing: IconButton(icon:const Icon(Icons.delete_outline_outlined),onPressed: () {}),
              //  )
              //  Padding(
              //    padding: const EdgeInsets.all(8.0),
              //    child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //        Expanded(
              //         flex: 2,
              //          child: Text(
              //                    "${translateDatabase(categoriesModel.servesNameAr, categoriesModel.servesName)}",
              //                    style: const TextStyle(fontSize: 18, color: AppColor.black),
              //                  ),
              //        ),
              //            Expanded(flex: 1,
              //              child: IconButton(icon:const Icon(Icons.delete_outline_outlined),onPressed: () {}))
              //     ],
              //    ),
              //  )
            ]),
      ),
    );
  }
}
