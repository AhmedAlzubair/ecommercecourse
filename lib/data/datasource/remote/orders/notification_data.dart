import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.notification, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
