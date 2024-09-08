import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/controller/controller.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/view/sign_in/sign_in_empty_state.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constantWidget.dart';
import '../../utils/pref_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

backClick() {
  Constant.closeApp();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SideMenuProfifileScreenController sideMenuProfifileScreenController =
      Get.put(SideMenuProfifileScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuNotificationScreenController>(
      init: SideMenuNotificationScreenController(),
      builder: (sideMenuNotificationScreenController) => SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Column(
              children: [
                getVerSpace(30.h),
                getAssetImage("user_image.png", height: 100.h, width: 100.w),
                getVerSpace(20.h),
                getCustomFont("Darlene Robertson", 18.sp, Color(0XFF000000), 1,
                    fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                getVerSpace(8.h),
                getCustomFont(
                    "darlenerobertson@gmail.com", 16.sp, Color(0XFF808080), 1,
                    fontWeight: FontWeight.w500),
                getVerSpace(20.h),
                getProfileOption("profile_icon.svg", "My Profile", () {

                  Constant.sendToNext(context, Routes.myProfileScreenRoute);
                }),
                getVerSpace(20.h),
                GetBuilder<SideDrawerController>(
                  init: SideDrawerController(),
                  builder: (sideDrawerController) => getProfileOption(
                      "unselected_address_icon_lt.svg", "My Address", () {
                    sideDrawerController.addAddessScreen(false);
                    Constant.sendToNext(
                        context, Routes.sideMenuAddressScreenRoute);
                    // Get.to(MyAddress());
                  }),
                ),
                getVerSpace(20.h),
                GetBuilder<SideMenuPaymentMenuScreenController>(
                  init: SideMenuPaymentMenuScreenController(),
                  builder: (sideMenuPaymentMenuScreenController) =>
                      getProfileOption("card_icon.svg", "My Card", () {
                    sideMenuPaymentMenuScreenController.setPaymentScreen(false);
                    Constant.sendToNext(context, Routes.payMentScreenRoute);
                    // Get.to(MyCard());
                  }),
                ),
                getVerSpace(20.h),
                getProfileOption("setting_icon.svg", "Settings", () {
                 Constant.sendToNext(context, Routes.settingScreensRoute);
                }),
                getVerSpace(41.h),
              ],
            ),
            getVerSpace(20.h),
            getCustomButton(
              "Logout",
              () {
                Get.defaultDialog(
                    barrierDismissible: false,
                    title: '',
                    content: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        children: [
                          getCustomFont("Are you sure you want to Logout!",
                              24.sp, Color(0XFF000000), 2,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h, bottom: 13.h),
                            child: Row(
                              children: [
                                Expanded(
                                    child: getCustomButton("Yes", () {
                                  PrefData.setIsSignIn(true);
                                  Get.off(SignInEmptyState());
                                }, buttonheight: 50.h)),
                                SizedBox(width: 10.w),
                                Expanded(
                                    child: getCustomButton("No", () {
                                  Get.back();
                                },
                                        color: buttonColor,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: buttonColor,
                                            style: BorderStyle.solid,
                                            width: 1.0.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.h),
                                        ),
                                        buttonheight: 50.h)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            )
          ],
        ).paddingSymmetric(horizontal: 20.h),
      )),
    );
  }
}
