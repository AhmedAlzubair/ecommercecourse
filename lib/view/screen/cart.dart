// ignore_for_file: prefer_const_constructors
import 'package:ecommercecoursenmmm/controller/cart_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecoursenmmm/view/widget/cart/customitemscartlist.dart';
import 'package:ecommercecoursenmmm/view/widget/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatefatabase.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return
    Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor2,
              title: Text("My Cart",style: TextStyle(color:AppColor.whiteColor),),
            ),
           
            body:  SingleChildScrollView(
       child: GetBuilder<CartController>(
                builder: ((controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(height: 10),
                            TopCardCart(
                                message:
                                    "You Have ${cartController.totalcountitems} Items in Your List"),
                            Container(
                              margin:EdgeInsets.all(10) ,
                             // padding: EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  ...List.generate(
                                    cartController.cart.length,
                                    (index) => CustomItemsCartList(
                                        onAdd: ()  {
                                           cartController
                                              .addCard(cartController.cart[index].productId!);
                                        // cartController.refreshPage();
                                        },
                                        onRemove: ()  {
                                           cartController.remove(
                                              cartController.cart[index].productId!);
                                         // cartController.refreshPage();
                                        },
                                        imagename:
                                            "${cartController.cart[index].productImage}",
                                        name: "${translateDatabase(cartController.cart[index].productNameAr,cartController.cart[index].productName)}",
                                        price:
                                            "${controller.getPrice(cartController.cart[index].productPrice!, cartController.cart[index].productDiscount!)} SR",
                                        count:
                                            "${cartController.cart[index].countproduct}"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        GetBuilder<CartController>(
                builder: (controller) => BottomNavgationBarCart(
                    shipping: "0",
                    controllercoupon: controller.controllercoupon!,
                    onApplyCoupon: () {
                      controller.checkcoupon();
                    },
                    price: "${cartController.priceorders}",
                    discount: "${controller.discountcoupon}%",
                    totalprice: "${controller.getTotalPrice()}")),
                      ],
                    ))))
       ),
     );
  }
}
