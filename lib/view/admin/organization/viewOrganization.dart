
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/organization/homeAdminorganization_controller.dart';
import '../../../controller/admin/services/homeAdminService_controller.dart';


import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/admin/organization/listOrganizationHome.dart';
import '../../widget/admin/services/listRestorantsHome.dart';

class HomeOrganizationAdminView extends StatelessWidget {
  const HomeOrganizationAdminView({super.key});

  @override
  Widget build(BuildContext context) {
  HomeOrganizationAdminControllerImp controller=  Get.put(HomeOrganizationAdminControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "36".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body:GetBuilder<HomeOrganizationAdminControllerImp>(
      builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child:
              GridView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.serves.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => ListRestorantsOrgenizationAdminHome(
                  i: index,
                  categoriesModel: controller.serves[index],
                ),
              )
          ),
      ),
        ),
        floatingActionButton: FloatingActionButton(
           backgroundColor: AppColor.primaryColor,
          onPressed: () {
         // Get.offNamed(AppRoute.homeOrgenizationAdminAdd);
          controller.goToAdd();
        },
        child: const Icon(Icons.add),
        
       // child: ,
        
        ),
         floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
     
    );
  }
}
