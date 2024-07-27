// ignore_for_file: prefer_const_constructors

import 'package:ecommercecoursenmmm/controller/cart_controller.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/view/widget/cart/buttoncart.dart';
import 'package:ecommercecoursenmmm/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
 Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor2, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("price", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price SR", style: TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("discount", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$discount ", style: TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Delivery", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$shipping ", style: TextStyle(fontSize: 16)))
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor2))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalprice SR",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor2)))
                ],
              ),
            ]),
          ),
          SizedBox(height: 10),
          CustomButtonCart(
            textbutton: "Order",
            onPressed: () { 
              controller.goToPageCheckout() ; 
            },
          )
        ],
      
    );
  }
}
