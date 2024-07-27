import 'package:get/get.dart';

validInputPhone(String val, int max, String type) {

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }


  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < max) {
    return "can't be less than $max";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
