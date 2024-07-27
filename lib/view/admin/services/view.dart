
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/services/homeAdminService_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/admin/services/listRestorantsHome.dart';

class HomeServesAdminView extends GetView<HomeServiceAdminControllerImp> {
  const HomeServesAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeServiceAdminControllerImp());
    return  Scaffold(
        appBar: AppBar(
            title: Text(
          "49".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body:GetBuilder<HomeServiceAdminControllerImp>(
      builder: (controller) =>HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.serves.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => ListRestorantsServiceAdminHome(
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
          Get.offNamed(AppRoute.homeServesAdminAdd);
        },
        child: const Icon(Icons.add),
        
       // child: ,
        
        ),
         floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
      
    );
  }
}
