import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../controller/controller.dart';
import '../../models/notification_data_model.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

backCLick() {
  Constant.closeApp();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuNotificationScreenController>(
        init: SideMenuNotificationScreenController(),
        builder: (sideMenuNotificationScreenController) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(24.h),
                  getCustomAppBar("Notification", () {
                    backCLick();
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.h),
                                    border: Border.all(color: grey20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 56.h,
                                      width: 56.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.h),
                                          color: Color(0XFFFFE9D1)),
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
                                ).paddingAll(16.h),
                              ),
                              getVerSpace(index ==
                                      sideMenuNotificationScreenController
                                              .notification.length -
                                          1
                                  ? 0.h
                                  : 12.h),
                            ],
                          );
                        },
                      )).paddingOnly(bottom: 61.26.h, left: 20.h, right: 20.h)
                ],
              )
              // Column(
              //   children: [
              //     getVerSpace(24.h),
              //     getCustomAppBar("Notification", (){backclick();}),
              //     Align(
              //       alignment: Alignment.center,
              //       child: Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             getSvgImage("selected_notification_icon.svg",height: 100.h,width: 100.h),
              //             getVerSpace(32.h),
              //             getCustomFont("No notification", 20.sp, regularBlack, 1,fontWeight: FontWeight.w700)
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ).paddingSymmetric(horizontal: 20.h));
              ,
            ));
  }
}
