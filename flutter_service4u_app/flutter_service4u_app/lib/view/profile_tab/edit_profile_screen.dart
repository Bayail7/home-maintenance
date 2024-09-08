import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';

import '../../controller/controller.dart';
import '../../utils/color_category.dart';

class EditProfileSCreen extends StatefulWidget {
  const EditProfileSCreen({Key? key}) : super(key: key);

  @override
  State<EditProfileSCreen> createState() => _EditProfileSCreenState();
}

backClick() {
  Constant.backToFinish();
}

class _EditProfileSCreenState extends State<EditProfileSCreen> {
  EditProfileSCreenController editProfileSCreenController =
      Get.put(EditProfileSCreenController());
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () async {
          backClick();
          return false;
        },
        child: Scaffold(
            body: SafeArea(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                getVerSpace(24.h),
                getCustomAppBar("Edit Profile", () {}),
                getVerSpace(30.h),
                Stack(children: [
                  getAssetImage("profile_text.png",
                      height: 100.h, width: 100.w),
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: buttonColor),
                    child: getSvgImage("edit_icon.svg",
                            color: regularBlack, height: 30.h, width: 30.h)
                        .paddingAll(8.h),
                  ).paddingOnly(top: 82.h, left: 40.h),
                ]),
                getVerSpace(40.h),
                getEditProfileOptionFormate(false,
                    iconImage: "profile_icon.svg",
                    userdetail: "Darlene Robertson",
                    requredImage: true),
                getVerSpace(20.h),
                getEditProfileOptionFormate(false,
                    iconImage: "email_icon.svg",
                    userdetail: "darlenerobertson@gmail.com",
                    requredImage: true),
                getVerSpace(20.h),
                getEditProfileOptionFormate(false,
                    iconImage: "call_icon.svg",
                    userdetail: "(219) 555-0114",
                    requredImage: true),
              ],
            ),
            getCustomButton("Save", () {
              backClick();
            }).paddingOnly(bottom: 30.h)
          ],
        ).paddingSymmetric(horizontal: 20.h))));
  }
}
