import 'package:ecommercecoursenmmm/core/Class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class HomeServesData {
  Crud crud;
  HomeServesData(this.crud);

    getData() async {
    var response = await crud.postData(AppLink.catogreies, {});
    return response.fold((l) => l, (r) => r);
  }
}