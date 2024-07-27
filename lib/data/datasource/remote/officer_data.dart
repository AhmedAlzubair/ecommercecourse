import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class OfficerData {
  Crud crud;
  OfficerData(this.crud);
  getDataOfficer() async {
    var response = await crud.postData(AppLink.officeritem, {});
    return response.fold((l) => l, (r) => r);
  }
  search(String search) async {
    var response = await crud.postData(AppLink.officersearch, {"search":search.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
