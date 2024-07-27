import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email ,String password) async {
    var response = await crud.postData(AppLink.login, {
      "email" : email.toString() , 
      "password" : password.toString()   
    });
    return response.fold((l) => l, (r) => r);
  }
  logindata(String phone) async {
    var response = await crud.postData(AppLink.loginAuth, {
      "phone" : phone.toString() 
       
    });
    return response.fold((l) => l, (r) => r);
  }
}
