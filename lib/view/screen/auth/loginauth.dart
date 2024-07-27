
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinputPhone.dart';
import '../../widget/auth/customTextFormAuth.dart';
import '../../widget/auth/customTextTitleAuth.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';


class LoginAuth extends StatelessWidget {
  const LoginAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(LoginControllerImp());
    return  SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.backgroundcolor,
          body: PopScope(
        canPop: false,
        onPopInvoked: (onpop) {
      if (onpop) {
        return;
      }
      alertExitAppp;
    },
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,widget:
    Container(
              margin: EdgeInsets.all(10),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    SizedBox(height: 50,),
                    CustomTextTitleAuth(text: "9".tr,),
                    SizedBox(height: 30,),
                    CustomTextBodyAuth(text: "10".tr,),
                    SizedBox(height: 20,),
                    CustomTextFormAuth(
                     isNumber: true,
                     labeltext: "Phone",
                     iconData:Icons.phone ,
                     mycontroller: controller.phone,
                     valid:(val){ validInputPhone(val!,8,"phone");}, hinttext: 'Enter Phone Number',
                    ),
                    SizedBox(height: 60,),
                    CustomButtomAuth(
                        text: "26".tr,
                        onPressed: () {
                          controller. loginAuth();
                        }),
                        const SizedBox(height: 40),
                        CustomTextSignUpOrSignIn(
                          textone: "57".tr,
                          texttwo: "24".tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
    ),
        ),
    );
  }
}
