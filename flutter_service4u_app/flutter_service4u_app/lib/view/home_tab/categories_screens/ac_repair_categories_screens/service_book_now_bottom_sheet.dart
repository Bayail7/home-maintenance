import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service_hub_app/utils/constant.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/color_category.dart';
import '../../../../utils/constantWidget.dart';

class ServiceBookBottomSheet extends StatefulWidget {
  @override
  State<ServiceBookBottomSheet> createState() => _ServiceBookBottomSheetState();
}

class _ServiceBookBottomSheetState extends State<ServiceBookBottomSheet> {
  ServiceBookBottomSheetController serviceBookBottomSheetController =
      Get.put(ServiceBookBottomSheetController());
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();



  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<ServiceBookBottomSheetController>(
      init: ServiceBookBottomSheetController(),
      builder: (serviceBookBottomSheetController) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTextField(
              color: serviceBookBottomSheetController.selectedDate == null
                  ? grey40
                  : regularBlack, function: () {
            serviceBookBottomSheetController.selectDate(context);
          },
              type: TextInputType.none,
              serviceBookBottomSheetController.selectedDate == null
                  ? "Select Date"
                  : "${DateFormat("dd-MMM-yyyy").format(serviceBookBottomSheetController.selectedDate!)}",
              "calender_icon.svg",
              suffixiconpermition: true,
              fillColor: grey10,
              widget: GestureDetector(
                onTap: () {
                  serviceBookBottomSheetController.selectDate(context);
                },
                child: getSvgImage("down_arrow_icon_black.svg")
                    .paddingOnly(top: 15.h, bottom: 17.h, right: 18.h),
              )),
          getVerSpace(24.h),
          //DateFormat("dd-MM-yyyy").format(DateTime.parse("2019-09-30"))
          getTextField(
              color: serviceBookBottomSheetController.selectedTime == null
                  ? grey40
                  : regularBlack, function: () {
            serviceBookBottomSheetController.selectTime(context);
          },
              type: TextInputType.none,
              serviceBookBottomSheetController.selectedTime == null
                  ? "Select Time"
                  : "${serviceBookBottomSheetController.selectedTime!.format(context)}",
              "clock_icon.svg",
              suffixiconpermition: true,
              fillColor: grey10,
              widget: GestureDetector(
                onTap: () {
                  serviceBookBottomSheetController.selectTime(context);
                },
                child: getSvgImage("down_arrow_icon_black.svg")
                    .paddingOnly(top: 15.h, bottom: 17.h, right: 18.h),
              )),
          getVerSpace(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  getCustomFont("Total :", 16.sp, grey40, 1,
                      fontWeight: FontWeight.w400),
                  getHorSpace(6.h),
                  getCustomFont("30.00", 20.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700)
                ],
              ),
              Row(
                children: [
                  getCustomFont("Bill Details", 16.sp, darkYellow, 1,
                      fontWeight: FontWeight.w400, letterSpace: 0.01),
                  getHorSpace(8.h),
                  getSvgImage("down_arrow_icon.svg")
                ],
              )
            ],
          ),
          getVerSpace(30.h),
          getCustomButton(
              serviceBookBottomSheetController.selectedDate !=null &&
                      serviceBookBottomSheetController.selectedTime !=null
                  ? "Continue"
                  : "Book Now", serviceBookBottomSheetController.selectedDate !=null &&
              serviceBookBottomSheetController.selectedTime !=null?() {
            Constant.sendToNext(context, Routes.cheakOutScreenRoute);
          }:() {
            Fluttertoast.showToast(
              msg: "Please Select Date and Time",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: buttonColor,
              textColor: regularBlack,
              fontSize: 16.0,
            );
          }),
        ],
      ).paddingOnly(top: 32.h, bottom: 30.h, left: 20.h, right: 20.h),
    );
  }
}
