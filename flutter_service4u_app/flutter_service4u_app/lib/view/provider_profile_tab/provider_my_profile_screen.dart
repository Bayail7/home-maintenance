import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/view/home_tab/categories_screens/ac_repair_categories_screens/add_new_card_screen.dart';

import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class ProviderMyProfileScreen extends StatefulWidget {
const ProviderMyProfileScreen({Key? key}) :super(key: key);

  @override
  State<ProviderMyProfileScreen> createState() => _providerMyProfileScreenState();
}

class _providerMyProfileScreenState extends State<ProviderMyProfileScreen> {
  ProviderMyProfileScreenController providermyProfileScreenController =
      Get.put(ProviderMyProfileScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: GetBuilder<ProviderMyProfileScreenController>(
        init: ProviderMyProfileScreenController(),
        builder: (providerMyProfileScreenController) => Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    getVerSpace(24.h),
                    getCustomAppBar("My Profile", () {
                      backClick();
                    }),
                    getVerSpace(30.h),
                    getAssetImage("profile_text.png",
                        height: 100.h, width: 100.h),
                    getVerSpace(20.h),
                    getVerSpace(40.h),
                    getMyprofileDetailFormate(
                        "profile_icon.svg", "Name", "Darlene Robertson"),
                    getVerSpace(20.h),
                    getDivider(),
                    getVerSpace(20.h),
                    getMyprofileDetailFormate("email_icon.svg", "Email",
                        "darlenerobertson@gmail.com"),
                    getVerSpace(20.h),
                    getDivider(),
                    getVerSpace(20.h),
                    getMyprofileDetailFormate(
                        "call_icon.svg", "Phone Number", "(219) 555-0114"),
                    getVerSpace(30.h),
                  ],
                ).paddingSymmetric(horizontal: 20.h),
                getCustomButton("Edit Profile", () {
                  Constant.sendToNext(context, Routes.EditProfileProSCreenRoute);
                }).paddingSymmetric(horizontal: 20.h),
              ],
            ).paddingOnly(bottom: 30.h),
          ),
        ),
      ),
    );
  }
}
