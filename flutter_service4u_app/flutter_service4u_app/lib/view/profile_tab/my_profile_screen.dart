import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/view/home_tab/categories_screens/ac_repair_categories_screens/add_new_card_screen.dart';

import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  MyProfileScreenController myProfileScreenController =
      Get.put(MyProfileScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: GetBuilder<MyProfileScreenController>(
        init: MyProfileScreenController(),
        builder: (myProfileScreenController) => Scaffold(
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
                  Constant.sendToNext(context, Routes.editProfileSCreenRoute);
                }).paddingSymmetric(horizontal: 20.h),
              ],
            ).paddingOnly(bottom: 30.h),
          ),
        ),
      ),
    );
  }
}
