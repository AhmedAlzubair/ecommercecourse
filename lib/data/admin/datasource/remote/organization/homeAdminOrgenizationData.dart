import 'dart:io';

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class HomeAdminOrganizationData {
  Crud crud;
  HomeAdminOrganizationData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.vieworgenization, {});
    return response.fold((l) => l, (r) => r);
  }
    getDataSerCat(String id) async {
    var response = await crud.postData(AppLink.viewservicesCat, {"id":id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  editDataSer(Map data,File? file) async {
    var response = await crud.addRequestWithImage(AppLink.editorgenization, data,file);
    return response.fold((l) => l, (r) => r);
  }

  deleteDataserves(int id, String imageold) async {
    var response = await crud.postData(AppLink.deleteorgenization,
        {"id": id.toString(), "imagename": imageold.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addDataserves(Map data,File? file) async {
        var response = await crud.addRequestWithImage(AppLink.addorgenization, data,file);
    return response.fold((l) => l, (r) => r);
  }


  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
