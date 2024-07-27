
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';


class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          //
              children: [
                Image.asset(
                  onBoardingList[i].image!,
                  width:double.infinity ,
                 height: 200,
                  //fit: BoxFit.fill,
                ),
                const SizedBox(height: 40),
                Text(onBoardingList[i].title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: AppColor.black)),
                const SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                           fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
              ],
            ));
  }
}
