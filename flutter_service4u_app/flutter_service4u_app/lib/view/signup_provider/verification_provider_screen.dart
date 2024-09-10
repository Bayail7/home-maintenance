import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/controller/controller.dart';
import 'package:service_hub_app/routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../utils/constantWidget.dart';
import '../../utils/pref_data.dart';

class VerificationProviderScreen extends StatefulWidget {
  @override
  State<VerificationProviderScreen> createState() => _VerificationProviderScreenState();
}



class _VerificationProviderScreenState extends State<VerificationProviderScreen> {
 VerificationScreenController verificationProviderScreenController  =
      Get.put(VerificationScreenController());
  TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  backClick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<VerificationProviderScreenController>(
      init: VerificationProviderScreenController(),
      builder: (verificationProviderController) => WillPopScope(
        onWillPop: () async {
          backClick();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(30.h),
                  getCustomAppBar("Verification", () {
                    backClick();
                  }),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          getVerSpace(30.h),
                          getTextField("Enter OTP", "otp_icon.svg",
                              controller: otpController, validator: (otp) {
                            if (otp == null || otp.isEmpty) {
                              return 'Please enter OTP';
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          getCustomButton("Verify OTP", () {
                            if (formKey.currentState!.validate()) {
                              // Perform OTP verification logic for the provider
                              // Navigate to the next screen upon successful verification
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(left: 20.h, right: 20.h),
            ),
          ),
        ),
      ),
    );
  }
}

