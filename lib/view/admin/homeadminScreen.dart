import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';
import '../../core/constant/imgaeasset.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
     SettingsController controller = Get.put(SettingsController());
    return Scaffold(
         appBar: AppBar(
          centerTitle: true,
          title:Text("31".tr,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),) ,),
      drawer: Drawer(
          backgroundColor: AppColor.primaryColor2,
          child: Container(
            height: Get.height / 3,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: Get.width / 3, color: AppColor.primaryColor),
                      Positioned(
                          top: Get.width / 3.9,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[100],
                              backgroundImage: AssetImage(AppImageAsset.avatar),
                            ),
                          )),
                    ]),
                SizedBox(height: 100),
                Text(
                  controller.username!,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ListTile(
                  onTap: () {
                   controller.logout();
                  },
                  title: Text("32".tr,
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  trailing:
                      Icon(Icons.exit_to_app, color: AppColor.primaryColor),
                ),
              ],
            ),
          ),
        ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            children: [
             
              // CardAdminHomeScreen(
              //   name: "Services",
              //   iconData: Icons.category_outlined,
              //   onTap: () {
              //     Get.toNamed(AppRoute.homeServesAdminView);
              //   },
              // ),
              CardAdminHomeScreen(
                name: "34".tr,
                iconData: Icons.category_outlined,
                 onTap: () {
                  Get.toNamed(AppRoute.homeCategoriesAdminView);
                },
              ),
              CardAdminHomeScreen(
                name: "33".tr,
                iconData: Icons.production_quantity_limits_outlined,
                 onTap: () {
                  Get.toNamed(AppRoute.homeProductsAdminView);
                },
              ),
              CardAdminHomeScreen(
                name: "35".tr,
                iconData: Icons.production_quantity_limits_outlined,
                 onTap: () {
                  Get.toNamed(AppRoute.homeAdmin);
                },
              ),
              // CardAdminHomeScreen(
              //   name: "36".tr,
              //   iconData: Icons.production_quantity_limits_outlined,
              //    onTap: () {
              //     Get.toNamed(AppRoute.homeOrgenizationAdminView);
              //   },
              // ),
            ]),
      ),
    );
  }
}

class CardAdminHomeScreen extends StatelessWidget {
  final String name;
  //final String image;
  final IconData iconData;
  final void Function()? onTap;
  const CardAdminHomeScreen(
      {super.key, required this.name, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.asset(image)
                Icon(
                  iconData,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColor.primaryColor2),
                )
              ]),
        ),
      ),
    );
  }
}
