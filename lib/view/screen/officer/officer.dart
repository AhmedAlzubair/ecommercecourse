import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller.dart';
import '../../../controller/officer_Contoroller.dart';
import '../../../core/class/handlingdataview.dart';

import '../../../core/constant/routes.dart';

import '../../widget/customOfficer.dart';
import '../../widget/customappbar.dart';
import '../../widget/items/LlstItemsSearch.dart';

class Officer extends StatelessWidget {
  const Officer({super.key});

  @override
  Widget build(BuildContext context) {
    OfficerControllerImp controller = Get.put(OfficerControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor2,
         // titleTextStyle:const TextStyle(color: AppColor.grey2),
          centerTitle: true,
          title: Text("Free",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.whiteColor)
          ),
        ),
        body: GetBuilder<OfficerControllerImp>(
            builder: (controller) => SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(children: [
                        // const SizedBox(height: 20),
                       // const Text("Free",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.primaryColor),),
                        // CustomAppBar(
                        //   mycontroller: controller.search!,
                        //   titleappbar: "Find Product",
                        //   // onPressedIcon: () {},
                        //   onPressedSearch: () {
                        //     controller.onSearchItems();
                        //   },
                        //   onChanged: (val) {
                        //     controller.checkSearch(val);
                        //   },
                        //   onPressedIconFavorite: () {
                        //     Get.toNamed(AppRoute.myfavroite);
                        //   },
                        // ),
      
                        HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: !controller.isSearch
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.itemsData.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.6),
                                    itemBuilder: (BuildContext context, index) {
                                      // controllerFav.isFavorite[controller
                                      //         .itemsData[index].productId] =
                                      //     controller.itemsData[index].favorite;
                                      return CustomListOfficer(
                                          itemsModel: controller.itemsData[index]);
                                    })
                                :
                                 ListView.builder(
                                    itemCount: controller.listdata.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CustomListOfficer(
                                          itemsModel: controller.listdata[index]);
                                    })
      
                           // ListItemsSearch(listdatamodel: controller.listdata,)
                            )
      
                        //: ListItemsSearch(itemsModel: controller.listdata)
                      ])),
                )),
      ),
    );
  }
}
