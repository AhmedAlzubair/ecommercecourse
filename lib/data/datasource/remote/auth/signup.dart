import 'package:ecommercecoursenmmm/core/class/crud.dart';
import 'package:ecommercecoursenmmm/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username.toString() , 
      "password" : password.toString()  , 
      "email" : email.toString() , 
      "phone" : phone.toString()  
    });
    return response.fold((l) => l, (r) => r);
  }
}
