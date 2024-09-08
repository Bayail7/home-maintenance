import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service_hub_app/utils/color_category.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/cheak_out_screen_common_widget.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class CheakOutScreen extends StatefulWidget {
  @override
  State<CheakOutScreen> createState() => _CheakOutScreenState();
}

backclick() {
  Constant.backToFinish();
}

class _CheakOutScreenState extends State<CheakOutScreen> {
  CheakOutScreenController cheakOutScreenController =
      Get.put(CheakOutScreenController());
  PromoCodeScreenController promoCodeScreenController =
      Get.put(PromoCodeScreenController());
  PhoneNumberScreenController phoneNumberScreenController =
      Get.put(PhoneNumberScreenController());
  SideDrawerController sideDrawerController = Get.put(SideDrawerController());
  PayMentScreenController payMentScreenController =
      Get.put(PayMentScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<PayMentScreenController>(
        init: PayMentScreenController(),
        builder: (payMentScreenController) => GetBuilder<
                PhoneNumberScreenController>(
            init: PhoneNumberScreenController(),
            builder: (phoneNumberScreenController) =>
                GetBuilder<SideDrawerController>(
                  init: SideDrawerController(),
                  builder: (SideDrawerController) => WillPopScope(
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
                          getCustomAppBar("Check Out", () {
                            backclick();
                          }).paddingSymmetric(horizontal: 20.h),
                          getVerSpace(32.h),
                          Expanded(
                              child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              getCustomFont("Services", 16.sp, regularBlack, 1,
                                      fontWeight: FontWeight.w500)
                                  .paddingSymmetric(horizontal: 20.h),
                              getVerSpace(20.h),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.h),
                                    border: Border.all(color: grey20)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 60.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.h),
                                          color: grey10),
                                      child: getAssetImage("ac_repair_icon.png")
                                          .paddingAll(10.h),
                                    ),
                                    getHorSpace(14.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        getCustomFont(
                                            "AC Repair Service",
                                            16.sp,
                                            context.theme.primaryColor,
                                            1,
                                            fontWeight: FontWeight.w400),
                                        getVerSpace(6.h),
                                        getCustomFont("1 Ton-1.5 Ton X2", 13.sp,
                                            grey40, 1,
                                            fontWeight: FontWeight.w400)
                                      ],
                                    ),
                                  ],
                                ).paddingAll(14.h),
                              ).paddingSymmetric(horizontal: 20.h),
                              getVerSpace(24.h),
                              GetBuilder<ServiceBookBottomSheetController>(
                                init: ServiceBookBottomSheetController(),
                                builder: (serviceBookBottomSheetController) =>
                                    Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont(
                                          "Date & Time", 16.sp, regularBlack, 1,
                                          fontWeight: FontWeight.w700),
                                      getVerSpace(20.h),
                                      getTextField(
                                          color:
                                              serviceBookBottomSheetController
                                                          .selectedDate ==
                                                      null
                                                  ? grey40
                                                  : regularBlack, function: () {
                                        serviceBookBottomSheetController
                                            .selectDate(context);
                                      },
                                          type: TextInputType.none,
                                          serviceBookBottomSheetController
                                                      .selectedDate ==
                                                  null
                                              ? "Select Date"
                                              : "${DateFormat("dd-MMM-yyyy").format(serviceBookBottomSheetController.selectedDate!)}",
                                          "calender_icon.svg",
                                          suffixiconpermition: true,
                                          fillColor: grey10,
                                          widget: GestureDetector(
                                            onTap: () {
                                              serviceBookBottomSheetController
                                                  .selectDate(context);
                                            },
                                            child: getSvgImage("edit_icon.svg")
                                                .paddingOnly(
                                                    top: 15.h,
                                                    bottom: 17.h,
                                                    right: 18.h),
                                          )),
                                      getVerSpace(16.h),
                                      getTextField(
                                          color:
                                              serviceBookBottomSheetController
                                                          .selectedTime ==
                                                      null
                                                  ? grey40
                                                  : regularBlack, function: () {
                                        serviceBookBottomSheetController
                                            .selectTime(context);
                                      },
                                          type: TextInputType.none,
                                          serviceBookBottomSheetController
                                                      .selectedTime ==
                                                  null
                                              ? "Select Time"
                                              : "${serviceBookBottomSheetController.selectedTime!.format(context)}",
                                          "clock_icon.svg",
                                          suffixiconpermition: true,
                                          fillColor: grey10,
                                          widget: GestureDetector(
                                            onTap: () {
                                              serviceBookBottomSheetController
                                                  .selectTime(context);
                                            },
                                            child: getSvgImage("edit_icon.svg")
                                                .paddingOnly(
                                                    top: 15.h,
                                                    bottom: 17.h,
                                                    right: 18.h),
                                          )),
                                    ],
                                  ).paddingSymmetric(horizontal: 20.h),
                                ),
                              ),
                              getVerSpace(10.h),
                              CheakOutScreenCommonWidget()
                            ],
                          )),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.h),
                                  topRight: Radius.circular(16.h),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, -6),
                                      blurRadius: 22,
                                      color: regularBlack.withOpacity(0.04))
                                ],
                                color: regularWhite),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        getCustomFont(
                                            "Total :", 16.sp, grey40, 1,
                                            fontWeight: FontWeight.w400),
                                        getHorSpace(6.h),
                                        getCustomFont(
                                            "30.00", 20.sp, regularBlack, 1,
                                            fontWeight: FontWeight.w700)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        getCustomFont("Bill Details", 16.sp,
                                            darkYellow, 1,
                                            fontWeight: FontWeight.w400,
                                            letterSpace: 0.01),
                                        getHorSpace(8.h),
                                        getSvgImage("down_arrow_icon.svg")
                                      ],
                                    )
                                  ],
                                ),
                                getVerSpace(30.h),
                                (SideDrawerController.selectAddressIndex ==
                                            null ||
                                        phoneNumberScreenController
                                                .selectNumberIndex ==
                                            null ||
                                        payMentScreenController
                                                .selectPaymentIndex ==
                                            null)
                                    ? getCustomButton(
                                        "Place Order",
                                        newbuttonColor: grey10,
                                        () {
                                          Fluttertoast.showToast(
                                            msg: "Please Select Address, Phone number and Payment method",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: buttonColor,
                                            textColor: regularBlack,
                                            fontSize: 16.0,
                                          );
                                        })
                                    : getCustomButton("Place Booking", () {
                                        Constant.sendToNext(context,
                                            Routes.orderConfirmScreenRoute);
                                      }),
                              ],
                            ).paddingOnly(
                                left: 20.h,
                                right: 20.h,
                                top: 20.h,
                                bottom: 30.h),
                          )
                        ],
                      )),
                    ),
                  ),
                )));
  }
}
