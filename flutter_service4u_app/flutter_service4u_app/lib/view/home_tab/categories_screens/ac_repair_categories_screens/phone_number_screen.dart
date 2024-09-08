import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/controller.dart';
import '../../../../models/phone_number_data_model.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/color_category.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  backclick() {
    Constant.backToFinish();
  }

  PhoneNumberScreenController phoneNumberScreenController =
      Get.put(PhoneNumberScreenController());
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    return GetBuilder<PhoneNumberScreenController>(
      init: PhoneNumberScreenController(),
      builder: (phoneNumberScreenController) => WillPopScope(
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
                  getCustomAppBar("Add Number", () {
                    backclick();
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      color: context.theme.focusColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("Add New Number", 16.sp, regularBlack, 1,
                            fontWeight: FontWeight.w500),
                        getVerSpace(14.h),
                        getTextField("Phone Number", "call_icon.svg",
                            suffixiconpermition: true,
                            fillColor: grey10,
                            widget: GestureDetector(
                                onTap: () {},
                                child: Container(
                                        height: 34.h,
                                        width: 71.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.h),
                                            color: buttonColor),
                                        child: Center(
                                            child: getCustomFont(
                                                "Save", 14.sp, regularBlack, 1,
                                                fontWeight: FontWeight.w500)))
                                    .paddingSymmetric(
                                        vertical: 11.h, horizontal: 16.h))),
                      ],
                    ).paddingSymmetric(horizontal: 16.h, vertical: 17.h),
                  ),
                  getVerSpace(16.h),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.h),
                        border: Border.all(color: grey20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont(
                                "Phone number", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w500),
                            add_button(
                                phoneNumberScreenController.phone.length == 0
                                    ? "Add"
                                    : "Change",
                                phoneNumberScreenController.phone.length == 0
                                    ? "add_icon_black.svg"
                                    : "edit_icon.svg", () {
                              Constant.sendToNext(
                                  context, Routes.phoneNumberScreenRoute);
                            })
                          ],
                        ),
                        getVerSpace(6.h),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: phoneNumberScreenController.phone.length,
                          itemBuilder: (context, index) {
                            PhoneNumbers number =
                                phoneNumberScreenController.phone[index];
                            return phone_number_formate(number.userImage,
                                number.phoneNumber, number.category, () {
                              phoneNumberScreenController.setNumber(number.id);
                              phoneNumberScreenController.setNumberIndex(index);
                            },
                                radioButtonpermition: true,
                                radioWidget: getSvgImage(
                                    phoneNumberScreenController.id == number.id
                                        ? "select_radio_icon.svg"
                                        : "unselect_radio_icon.svg"));
                          },
                        ),
                      ],
                    ).paddingAll(16.h),
                  ).paddingSymmetric(horizontal: 20.h),
                ],
              ),
            ),
          )),
    );
  }
//
// Widget phone_number_formet(userImage,phonenumber,category,id){
//   return  GetBuilder<PhoneNumberScreenController>(
//     init: PhoneNumberScreenController(),
//     builder:(phoneNumberScreenController) => GestureDetector(
//       onTap: (){
//         phoneNumberScreenController.setSelectNumber(userImage,phonenumber,category,id);
//       },
//       child: Row(
//         children: [
//           Container(
//             height: 56.h,
//             width: 56.h,
//             decoration: BoxDecoration(shape: BoxShape.circle),
//             child: getAssetImage(userImage),),
//           getHorSpace(16.sp),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               getCustomFont(phonenumber, 16.sp, context.theme.primaryColor, 1,fontWeight: FontWeight.w700),
//               getVerSpace(4.h),
//               getCustomFont(category, 13.sp, Color(0XFF888C97), 1,fontWeight: FontWeight.w500),
//             ],
//           )
//         ],
//       ).paddingSymmetric(horizontal: 16.h),
//     ),
//   );
// }
}
