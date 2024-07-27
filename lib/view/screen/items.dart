import 'package:ecommercecoursenmmm/controller/favorite_controller.dart';
import 'package:ecommercecoursenmmm/controller/items_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/view/widget/customappbar.dart';
import 'package:ecommercecoursenmmm/view/widget/items/customlistitems.dart';
import 'package:ecommercecoursenmmm/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/listServesHome.dart';
import '../widget/items/LlstItemsSearch.dart';
import '../widget/items/listCategories.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return   GetBuilder<ItemsControllerImp>(
              builder: (controller) =>  Container(
         padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleappbar: "73".tr,
            //iconData: Icons.arrow_forward,
            // onPressedIcon: () {},
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
            onPressedIconFavorite: () {
                        Get.toNamed(AppRoute.myfavroite);
                    },
          ),
          const SizedBox(height: 20),
         // const ListCategoriesItems(),
         
        SingleChildScrollView(
                        child: Column(
                          children: [
                             const ListCategoriesHome(),
                             HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                                     shrinkWrap: true,
                                    // physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.itemsData.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2, childAspectRatio: 0.6),
                                    itemBuilder: (BuildContext context, index) {
                                            
                                      controllerFav.isFavorite[controller.itemsData[index].productId] =
                                          controller.itemsData[index].favorite;
                                      return CustomListItems(
                                          itemsModel: controller.itemsData[index]);
                                    }
                      )
                                    
                              
                          
                       
                     
                      : ListItemsSearch(listdatamodel: controller.listdata))
                       ],
                       ))
              ]))
      
    );
  }
}





















// favoriteController.isFavorite[controller.data[index]
                            // ['items_id']] = controller.data[index]['favorite'];
