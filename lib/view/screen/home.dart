
import 'package:ecommercecoursenmmm/controller/home_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';

import 'package:ecommercecoursenmmm/linkapi.dart';
import 'package:ecommercecoursenmmm/view/widget/customappbar.dart';
import 'package:ecommercecoursenmmm/view/widget/home/customcardhome.dart';
import 'package:ecommercecoursenmmm/view/widget/home/customtitlehome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatefatabase.dart';
import '../../data/Model/servesModel.dart';
import '../widget/home/listRestorantsHome.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
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
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  CustomCardHome(
                                      title: "A summer surprise",
                                      body: "Cashback 20%"),
                                  CustomTitleHome(title: "49".tr),
                            
                                
                               const Restorants(),
                                ],
                              ),
                          )
                          : ListServerSearch(listdatamodel:controller.listdata)
                          )
                ],
              )),
        );
  }
}

class ListServerSearch extends GetView<HomeControllerImp> {
  final List<ServesModel> listdatamodel;
  const ListServerSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
               controller.goTocat(listdatamodel, index, listdatamodel[index].servesId!);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding:const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Image.network(
                            
                                "${AppLink.imagestService}/${listdatamodel[index].servesImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(translateDatabase(listdatamodel[index].servesNameAr!,listdatamodel[index].servesName!)),
                          //subtitle: Text(listdatamodel[index].!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
