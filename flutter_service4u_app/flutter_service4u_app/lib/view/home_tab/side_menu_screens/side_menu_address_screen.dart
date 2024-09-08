import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/models/address_data_model.dart';
import '../../../controller/controller.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constant.dart';
import '../../../utils/constantWidget.dart';

class SideMenuAddressScreen extends StatefulWidget {
  @override
  State<SideMenuAddressScreen> createState() => _SideMenuAddressScreenState();
}

class _SideMenuAddressScreenState extends State<SideMenuAddressScreen> {
  backclick() {
    Constant.backToFinish();
  }

  SideDrawerController sideDrawerController = Get.put(SideDrawerController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SideDrawerController>(
      init: SideDrawerController(),
      builder: (sideDrawerController) => WillPopScope(
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
                  getCustomAppBar("Address", () {
                    backclick();
                  }).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(32.h),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        sideDrawerController.addAddress
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.h),
                                  border: Border.all(color: grey20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getCustomFont("At my current location",
                                        16.sp, regularBlack, 1,
                                        fontWeight: FontWeight.w500),
                                    getSvgImage("current_location_icon.svg")
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 16.h, vertical: 17.h),
                              ).paddingOnly(
                                left: 16.h, right: 16.h, top: 16.87.h)
                            : SizedBox(),
                        getVerSpace(16.h),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              border: Border.all(color: grey20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont("Address", 16.sp, regularBlack, 1,
                                  fontWeight: FontWeight.w500),
                              getVerSpace(8.h),
                              ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount:
                                    sideDrawerController.addressData.length,
                                itemBuilder: (context, index) {
                                  Address address =
                                      sideDrawerController.addressData[index];
                                  return address_formate(
                                      address.icon!,
                                      address.addressType!,
                                      address.address!,
                                      sideDrawerController.addAddress
                                          ? () {
                                              sideDrawerController
                                                  .setAddress(address.id);
                                              sideDrawerController
                                                  .setAddressIndex(index);
                                            }
                                          : () {
                                              SizedBox();
                                            },
                                      radioWidget: sideDrawerController
                                              .addAddress
                                          ? getSvgImage(
                                              sideDrawerController.addressID ==
                                                      address.id
                                                  ? "select_radio_icon.svg"
                                                  : "unselect_radio_icon.svg")
                                          : SizedBox(),
                                      radioButtonpermition: true);
                                },
                              ),
                            ],
                          ).paddingAll(16.h),
                        ).paddingSymmetric(horizontal: 20.h),
                        getVerSpace(32.h),
                        sideDrawerController.addAddress
                            ? GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.h),
                                      color: grey10),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        getCustomFont("Add Address", 13.sp,
                                            regularBlack, 1,
                                            fontWeight: FontWeight.w400),
                                        getSvgImage("add_icon_black.svg")
                                      ],
                                    ).paddingOnly(top: 8.h, bottom: 8.h),
                                  ),
                                ).paddingSymmetric(horizontal: 143.h),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  sideDrawerController.addAddress
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: context.theme.focusColor,
                            child: getCustomButton("Done", () {
                              sideDrawerController.setFinalAddressIndex(
                                  sideDrawerController.addressIndex);
                              backclick();
                            }).paddingOnly(
                                left: 20.h, right: 20.h, bottom: 30.h),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          )),
    );
  }
}
