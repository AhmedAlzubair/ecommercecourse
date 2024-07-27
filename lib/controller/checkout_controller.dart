import 'package:ecommercecoursenmmm/core/class/statusrequest.dart';
import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/functions/handingdatacontroller.dart';
import 'package:ecommercecoursenmmm/core/services/services.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/address_data.dart';
import 'package:ecommercecoursenmmm/data/datasource/remote/checkout_date.dart';
import 'package:ecommercecoursenmmm/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../data/datasource/remote/orders/checkoutdata.dart';
import '../data/datasource/remote/organization_data.dart';
import '../data/model/organizationModel.dart';

class CheckoutControllerImp extends GetxController {
 // AddressData addressData = AddressData(Get.find());
  //  AddressData addressData = Get.put(AddressData(Get.find()));
 // CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
 // OrganizationData organizationData = OrganizationData(Get.find());
   //AddressData addressData = Get.find();
  // CheckoutDataa checkoutDataa = Get.put(CheckoutDataa(Get.find()));

  CheckoutData checkoutData = CheckoutData(Get.find());
  // CheckoutDataa checkoutDataa = Get.put(CheckoutDataa());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String priceorders;
  String? userid;
  List<AddressModel> dataaddress = [];
  List<OrganizationModel> organizationModel = [];
  int orgid = 0;
  String? orgname ;
  chooseType2(int ty, String name) {
    orgid = ty;
    orgname = name;

    update();
  }

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.getData(userid!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
        Get.toNamed(AppRoute.addressview);
      }
      // End
    }
    update();
  }

  // getOrganization() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await organizationData.getData();

  //   print("=============================== Controller $response ");

  //   statusRequest = handlingData(response);

  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       List listdata = response['data'];
  //       organizationModel
  //           .addAll(listdata.map((e) => OrganizationModel.fromJson(e)));
  //     } else {
  //       // statusRequest = StatusRequest.failure;
  //       // Get.toNamed(AppRoute.addressview);
  //     }
  //     // End
  //   }
  //   update();
  // }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }

    statusRequest = StatusRequest.loading;
    update();
    int pricedelivery = 10;
    Map data = {
      "usersid": userid.toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": pricedelivery.toString(),
      "ordersprice": priceorders.toString(),
      "coupondiscount": couponid.toString(),
      "couponid": "1",
      "paymentmethod": paymentMethod.toString()
    };
    // print("===============================2 Controller  ");
    var response = await checkoutData.checkout(data);
    //var response = await checkoutData.checkoutDat(userid!,addressid!,pricedelivery,deliveryType!,priceorders,couponid,coupondiscount,paymentMethod!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      Get.offAllNamed(AppRoute.homescreen);
      Get.snackbar("Success", "the order was successfully");
      // if (response['status'] == "success") {
      //   Get.offAllNamed(AppRoute.homescreen);
      //   Get.snackbar("Success", "the order was successfully");
      // } else {
      //   statusRequest = StatusRequest.none;
      //   Get.snackbar("Error", "try again");
      // }
      // End
    } else {
      statusRequest = StatusRequest.none;
      Get.snackbar("Error", "try again");
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'].toString();
    priceorders = Get.arguments['priceorder'].toString();
    coupondiscount = Get.arguments['discountcoupon'].toString();
    userid = myServices.sharedPreferences.getString("userid")!;
    // print(couponid);
    // print(priceorders);
    // print(coupondiscount);
    // print(userid);
    getShippingAddress();
   // getOrganization();
    super.onInit();
  }
}
