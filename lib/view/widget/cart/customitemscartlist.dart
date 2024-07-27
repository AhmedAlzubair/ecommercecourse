import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/constant/imgaeasset.dart';

import 'package:ecommercecoursenmmm/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.cyanAccent,
      child:
      Row(
          children: [
        Expanded(
          flex: 2,
          child:
          ClipRRect(
            borderRadius:const BorderRadius.only(topLeft: Radius.circular(4.0),bottomLeft: Radius.circular(4.0)),
            child: FadeInImage(placeholder:const AssetImage(AppImageAsset.place) ,
              image:NetworkImage( "${AppLink.imagestProduct}/$imagename",),
              width: double.infinity,
              height: 108,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name, style:const TextStyle(fontSize: 15)),
              subtitle: Text(price,
                  style:
                  const TextStyle(color: AppColor.primaryColor2, fontSize: 17,fontWeight: FontWeight.bold)),
            )),
        Expanded(
            child: Column(
              children: [
                Container(
                    height: 35,
                    child: IconButton(onPressed: onAdd, icon:const Icon(Icons.add,color: AppColor.primaryColor2,))),
                Container(
                    height: 30,
                    child: Text(
                      count,
                      style:const TextStyle(fontFamily: "sans",fontWeight: FontWeight.bold,fontSize: 15,color: AppColor.black),
                    )),
                Container(
                    height: 25,
                    child: IconButton(onPressed: onRemove, icon:const Icon(Icons.remove,color: AppColor.primaryColor2)))
              ],
            ))
      ]),


      );

  }
}
