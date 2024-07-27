import 'package:ecommercecoursenmmm/controller/orders/archive_controller.dart';
import 'package:ecommercecoursenmmm/controller/orders/pending_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/view/widget/orders/orderslistcard.dart';
import 'package:ecommercecoursenmmm/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Archive',style: TextStyle( color: AppColor.primaryColor2,),),

        ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersListArchive(listdata: controller.data[index])),
                  )))),
        ));
  }
}
