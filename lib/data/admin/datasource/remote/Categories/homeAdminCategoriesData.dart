import 'dart:io';

import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class HomeAdminCategoriesData {
  Crud crud;
  HomeAdminCategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewcategories, {});
    return response.fold((l) => l, (r) => r);
  }
  getDataCat(String catid) async {
    var response = await crud.postData(AppLink.viewcategoriespro, {"id":catid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getDataSer() async {
    var response = await crud.postData(AppLink.viewservices, {});
    return response.fold((l) => l, (r) => r);
  }


  editData(Map data,File? file) async {
    // var response = await crud.postData(AppLink.editservices, {
    //   "id": serId.toString(),
    //   "name": name.toString(),
    //   "namear": namear.toString()
    // });
    var response = await crud.addRequestWithImage(AppLink.editcategories, data,file);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int id, String imageold) async {
    var response = await crud.postData(AppLink.deletecategories,
        {"id": id.toString(), "imagename": imageold.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data,File? file) async {
    //var response = await crud.postData(AppLink.addservices, {});
        var response = await crud.addRequestWithImage(AppLink.addcategories, data,file);
    return response.fold((l) => l, (r) => r);
  }

  //   getDataSer(String usersid, String itemsid) async {
  //   var response = await crud.postData(AppLink.itemsview,
  //   {"userid": usersid, "productid": itemsid});
  //   return response.fold((l) => l, (r) => r);
  // }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
