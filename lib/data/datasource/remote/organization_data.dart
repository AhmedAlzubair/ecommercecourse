import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class OrganizationData {
  Crud crud;
  OrganizationData(this.crud);

    getData() async {
    var response = await crud.postData(AppLink.organization, {});
    return response.fold((l) => l, (r) => r);
  }
}