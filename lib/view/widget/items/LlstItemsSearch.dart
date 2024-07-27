import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/model/ItemsModel2.dart';
import '../../../linkapi.dart';

class ListItemsSearch extends StatelessWidget {
  final List<ItemsModel2> listdatamodel;
  final Function()? onTap;
  const ListItemsSearch({Key? key, required this.listdatamodel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
       // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding:const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: 
                  
               FadeInImage(placeholder:const AssetImage(AppImageAsset.place) ,
               image:NetworkImage("${AppLink.imagestProduct}/${listdatamodel[index].categoriersImage}",),
                width: double.infinity,
                height: 150,
                fit: BoxFit.fill,
               ),
              ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text( translateDatabase(
                              listdatamodel[index].productNameAr, listdatamodel[index].productName),),
                          subtitle: Text(listdatamodel[index].categoriersName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
