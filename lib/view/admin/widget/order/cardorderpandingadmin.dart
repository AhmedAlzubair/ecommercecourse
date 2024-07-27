import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controller/admin/orders/orderAdminpandingController.dart';


class CardOrderPandingAdmin extends GetView<OrderAdminPandingControllerImp> {
  final OrdersModel ordersModel;
  const CardOrderPandingAdmin({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ID: ${ordersModel.ordersId}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor2),
                  ),
                  //Jiffy()
                  Text(Jiffy.parse(ordersModel.ordersDatetime.toString(), pattern:"yyyy-MM-dd")
                      .fromNow()),
                ],
              ),
              Text("Order Price: ${ordersModel.ordersPrice}\$",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor2)),
              Text(
                  "Order Type: ${controller.printOrderType(ordersModel.ordersType!)}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor2)),
              Text(
                  "Order Pyment: ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor2)),
              Text("Order Total Price: ${ordersModel.ordersTotalprice}\$",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor2)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.goToDetails(ordersModel);
                    },
                    child: Text("Details",
                        style: TextStyle(
                            color: AppColor.primaryColor2,
                            fontWeight: FontWeight.bold)),
                  ),
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.prepareData(
                         ordersModel.ordersId.toString(),
                          ordersModel.ordersUsersid.toString(),
                          ordersModel.ordersType.toString()
                         );
                    },
                    child: Text(
                      "Pending",
                      style: TextStyle(
                          color: AppColor.primaryColor2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
