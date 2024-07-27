
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Categories/categoriesProductControllerView.dart';
import '../../../core/constant/color.dart';
import '../../widget/admin/Categories/listCatProductsHome.dart';

class CategoriesProductView extends StatelessWidget {
  const CategoriesProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesProductControllerImp());
    return GetBuilder<CategoriesProductControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            title: Text(
          "56".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.proData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => ListCategoriesProductsAdminHome(
                i: index,
                categoriesModel: controller.proData[index],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
           // Get.offNamed(AppRoute.homeProductsAdminAdd);
           // controller.goToAdd();
          },
          child: const Icon(Icons.add),

          // child: ,
        ),
        //  floatingActionButtonLocation:
        //           FloatingActionButtonLocation.,
      ),
    );
  }
}
