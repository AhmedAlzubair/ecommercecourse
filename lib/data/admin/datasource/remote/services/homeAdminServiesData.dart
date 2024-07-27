import 'dart:io';

import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class HomeAdminServiesData {
  Crud crud;
  HomeAdminServiesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewservices, {});
    return response.fold((l) => l, (r) => r);
  }
    getDataSerCat(String id) async {
    var response = await crud.postData(AppLink.viewservicesCat, {"id":id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  editDataSer(Map data,File? file) async {
    var response = await crud.addRequestWithImage(AppLink.editservices, data,file);
    return response.fold((l) => l, (r) => r);
  }

  deleteDataserves(int id, String imageold) async {
    var response = await crud.postData(AppLink.deleteservices,
        {"id": id.toString(), "imagename": imageold.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addDataserves(Map data,File? file) async {
        var response = await crud.addRequestWithImage(AppLink.addservices, data,file);
    return response.fold((l) => l, (r) => r);
  }


  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
