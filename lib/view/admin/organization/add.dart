import 'package:ecommercecoursenmmm/controller/address/add_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/admin/organization/addorganiztionAddress_controller.dart';

class AddressAddOrganization extends StatelessWidget {
  const AddressAddOrganization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddOrganiztionAddressController controllerpage = Get.put(AddOrganiztionAddressController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('65'.tr),
      ),
      body: Container(
        child: GetBuilder<AddOrganiztionAddressController>(
            builder: ((controllerpage) => HandlingDataView(
                statusRequest: controllerpage.statusRequest,
                widget: Column(children: [
                  if (controllerpage.kGooglePlex != null)
                    Expanded(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlong) {
                            controllerpage.addMarkers(latlong);
                          },
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            child: MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                controllerpage.goToPageAddDetailsAddress();
                              },
                              child:
                                  Text("8".tr, style: TextStyle(fontSize: 18)),
                              color: AppColor.primaryColor,
                              textColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ))
                ])))),
      ),
    );
  }
}
