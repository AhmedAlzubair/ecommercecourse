import 'package:ecommercecoursenmmm/controller/homescreen_controller.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => SafeArea(
              child: Scaffold(

                // bottomNavigationBar: const CustomBottomAppBarHome(),
                bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: AppColor.primaryColor2,
                    unselectedItemColor: AppColor.grey2,
                    showUnselectedLabels: true,
                    selectedLabelStyle:
                        const TextStyle(color: AppColor.primaryColor2),
                    unselectedLabelStyle:
                        const TextStyle(color: AppColor.grey2),
                    currentIndex: controller.currentpage,
                    onTap: (value) => controller.changePage(value),
                    items: [
                      ...List.generate(controller.listPage.length, (index) =>BottomNavigationBarItem(
                            label: controller.bottomappbar[index]['title'],
                            icon: Icon(controller.bottomappbar[index]['icon']))
                       
                         
                      )
                    ]),
                body: controller.listPage.elementAt(controller.currentpage),

                // floatingActionButton: FloatingActionButton(
                //     backgroundColor: AppColor.primaryColor,
                //     onPressed: () {
                //       Get.toNamed(AppRoute.cart);
                //     },
                //     child: const Icon(Icons.shopping_basket_outlined)),
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerDocked,
              ),
            ));
  }
}
