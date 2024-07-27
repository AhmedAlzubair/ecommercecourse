
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/organization/homeAdminorganization_controller.dart';
import '../../../../controller/admin/services/homeAdminService_controller.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imgaeasset.dart';
import '../../../../core/functions/translatefatabase.dart';
import '../../../../data/model/organizationModel.dart';
import '../../../../data/model/servesModel.dart';
import '../../../../linkapi.dart';


class OrganizationAdmin extends GetView<HomeOrganizationAdminControllerImp> {
  const OrganizationAdmin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.serves.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
      ),
      itemBuilder: (context, index) => ListRestorantsOrgenizationAdminHome(
        i: index,
        categoriesModel: controller.serves[index],
      ),
    );
  }
}

class ListRestorantsOrgenizationAdminHome
    extends GetView<HomeOrganizationAdminControllerImp> {
  final OrganizationModel categoriesModel;
  final int i;
  const ListRestorantsOrgenizationAdminHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      //  controller.goTocat(controller.serves, i, categoriesModel.servesId!);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.network(
              //   "${AppLink.imagestOrgenization}/${categoriesModel.orgenizationImage}",
              //   width: 200,
              //   height: 150,
              // ),
                            FadeInImage(placeholder:AssetImage(AppImageAsset.place) ,
               image:NetworkImage("${AppLink.imagestOrgenization}/${categoriesModel.orgenizationImage}",),
                width: double.infinity,
                height: 150,
               // fit: BoxFit.cover,
               ),
              //    CachedNetworkImage(
              //             imageUrl:
              //  "${AppLink.imagestOrgenization}/${categoriesModel.orgenizationImage}",
              //   width: double.infinity,
              //   height: 150,
              //   fit: BoxFit.cover,
              // ),
              //const SizedBox(height: 20,),
              // Text(categoriesModel.servesName!),
              Text(
                "${translateDatabase(categoriesModel.orgenizationNameAr, categoriesModel.orgenizationName)}",
                style: const TextStyle(fontSize: 18, color: AppColor.black),
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
                          controller.deleteServ(categoriesModel.orgenizationId!,
                              categoriesModel.orgenizationImage.toString());
                        }),
                  ],
                ),
              )
            
            ]),
      ),
    );
  }
}
