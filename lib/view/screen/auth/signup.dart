import 'package:ecommercecoursenmmm/controller/auth/signup_controller.dart';
import 'package:ecommercecoursenmmm/core/class/handlingdataview.dart';
import 'package:ecommercecoursenmmm/core/constant/color.dart';
import 'package:ecommercecoursenmmm/core/functions/alertexitapp.dart';
import 'package:ecommercecoursenmmm/core/functions/validinput.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/custombuttonauth.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/customtextformauth.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommercecoursenmmm/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('24'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) =>
                 HandlingDataRequest(statusRequest: controller.statusRequest,widget:  Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 20),
                            CustomTextTitleAuth(text: "9".tr),
                            const SizedBox(height: 10),
                            CustomTextBodyAuth(text: "10".tr),
                            const SizedBox(height: 15),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 20, "username");
                              },
                              mycontroller: controller.username,
                              hinttext: "17".tr,
                              iconData: Icons.person_outline,
                              labeltext: "16".tr,
                              // mycontroller: ,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 3, 40, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "19".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "18".tr,
                              // mycontroller: ,
                            ),
                            CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 7, 11, "phone");
                              },
                              mycontroller: controller.phone,
                              hinttext: "21".tr,
                              iconData: Icons.phone_android_outlined,
                              labeltext: "20".tr,
                              // mycontroller: ,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "23".tr,
                              iconData: Icons.lock_outline,
                              labeltext: "22".tr,
                              // mycontroller: ,
                            ),
                            CustomButtomAuth(
                                text: "24".tr,
                                onPressed: () {
                                  controller.signUp();
                                }),
                            const SizedBox(height: 40),
                            CustomTextSignUpOrSignIn(
                              textone: "25".tr,
                              texttwo: "26".tr,
                              onTap: () {
                                controller.goToSignIn();
                              },
                            ),
                          ]),
                        ),
                      )),
          )),
    );
  }
}