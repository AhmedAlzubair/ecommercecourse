import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class DetailsDeliveryData {
  Crud crud;
  DetailsDeliveryData(this.crud);
    getData(String cardorder) async {
    var response = await crud.postData(AppLink.ordersdetailsdelivery, {"id":cardorder.toString()});
    return response.fold((l) => l, (r) => r);
  }
  
}
