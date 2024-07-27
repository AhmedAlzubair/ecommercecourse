// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommercecoursenmmm/controller/orders/details_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/functions/translatefatabase.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details',style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              // TableRow(children: [
                              //   Text("Macbook m1", textAlign: TextAlign.center),
                              //   Text("2", textAlign: TextAlign.center),
                              //   Text("1200", textAlign: TextAlign.center),
                              // ]),
                              ...List.generate(
                                  controller.data.length,
                                  (index) => TableRow(children: [
                                        Text("${translateDatabase(controller.data[index].productNameAr,controller.data[index].productName)}",
                                            textAlign: TextAlign.center),
                                        Text("${controller.data[index].countproduct}", textAlign: TextAlign.center),
                                        Text("${controller.data[index].productPrice}",
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child:   Text("Total Price : ${controller.ordersModel.ordersTotalprice} SR",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor2,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.ordersModel.ordersType == "0")    Card(
                    child: Container(
                        child: ListTile(
                      title: const Text("Shipping Address",
                          style: TextStyle(
                              color: AppColor.primaryColor2,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                    )),
                  ),
              if (controller.ordersModel.ordersType == "0")    Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                    ),
                  )
                ])))),
      ),
    );
  }
}
