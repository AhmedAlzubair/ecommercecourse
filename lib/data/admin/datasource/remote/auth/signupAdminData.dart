import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class SignupAdminData {
  Crud crud;
  SignupAdminData(this.crud);
  postdata(String username ,String password ,String email ,String phone ,String type) async {
    var response = await crud.postData(AppLink.addAdmin, {
      "username" : username , 
      "password" : password  , 
      "email" : email , 
      "phone" : phone  , 
      "type":type
    });
    return response.fold((l) => l, (r) => r);
  }
    editdata(String username ,String password ,String email ,String phone ,String type) async {
    var response = await crud.postData(AppLink.addAdmin, {
      "username" : username , 
      "password" : password  , 
      "email" : email , 
      "phone" : phone  , 
      "type":type
    });
    return response.fold((l) => l, (r) => r);
  }
    deletedata(String userid ) async {
    var response = await crud.postData(AppLink.addAdmin, {
      "userid" : userid.toString() , 
     
    });
    return response.fold((l) => l, (r) => r);
  }
}