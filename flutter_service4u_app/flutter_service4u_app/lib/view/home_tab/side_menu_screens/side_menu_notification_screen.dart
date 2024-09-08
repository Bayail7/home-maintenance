import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controller.dart';
import '../../../models/notification_data_model.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constant.dart';
import '../../../utils/constantWidget.dart';

class SideMenuNotificationScreen extends StatefulWidget {
  @override
  State<SideMenuNotificationScreen> createState() =>
      _SideMenuNotificationScreenState();
}

class _SideMenuNotificationScreenState
    extends State<SideMenuNotificationScreen> {
  SideMenuNotificationScreenController sideMenuNotificationScreenController =
      Get.put(SideMenuNotificationScreenController());

  backclick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SideMenuNotificationScreenController>(
      init: SideMenuNotificationScreenController(),
      builder: (sideMenuNotificationScreenController) => WillPopScope(
          onWillPop: () async {
            backclick();
            return false;
          },
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(24.h),
                  getCustomAppBar("Notification", () {
                    backclick();
                  }).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(20.h),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: context.theme.focusColor,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        itemCount: sideMenuNotificationScreenController
                            .notification.length,
                        itemBuilder: (context, index) {
                          NotificationData notification =
                              sideMenuNotificationScreenController
                                  .notification[index];
                          return Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 56.h,
                                      width: 56.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: notification.bgColor),
                                      child: getSvgImage(notification.icon!)
                                          .paddingAll(15.h),
                                    ),
                                    getHorSpace(16.h),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getNotificationtext(
                                              notification.firstText!,
                                              " ${notification.secondText!}",
                                              " ${notification.thirdText!}",
                                              secondtextcolor:
                                                  Color(0XFF9A9FA5),
                                              firsttextcolor:
                                                  context.theme.primaryColor),
                                          getVerSpace(2.h),
                                          getCustomFont(notification.time!,
                                              12.sp, Color(0XFF535763), 1,
                                              fontWeight: FontWeight.w600)
                                        ],
                                      ).paddingOnly(right: 40.h),
                                    ),
                                    SizedBox(),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 20.h),
                              getVerSpace(index ==
                                      sideMenuNotificationScreenController
                                              .notification.length -
                                          1
                                  ? 0.h
                                  : 12.h),
                              index ==
                                      sideMenuNotificationScreenController
                                              .notification.length -
                                          1
                                  ? SizedBox()
                                  : Divider(
                                      color: greyButton,
                                    ).paddingSymmetric(horizontal: 16.h),
                              getVerSpace(index ==
                                          sideMenuNotificationScreenController
                                                  .notification.length -
                                              1
                                      ? 0.h
                                      : 12.h)
                                  .paddingSymmetric(horizontal: 16.h),
                            ],
                          );
                        },
                      )).paddingOnly(bottom: 61.26.h, left: 16.h, right: 16.h)
                ],
              ),
            ),
          )),
    );
  }
}
