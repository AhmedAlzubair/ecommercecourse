import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckoutDataa {
  Crud crud;
  CheckoutDataa(this.crud);
  checkoutData(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
