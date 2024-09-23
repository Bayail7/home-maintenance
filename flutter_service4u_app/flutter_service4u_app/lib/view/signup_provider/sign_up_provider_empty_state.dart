import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';

class SignUpProviderEmptyState extends StatefulWidget {
  @override
  State<SignUpProviderEmptyState> createState() => _SignUpProviderEmptyStateState();
}

class _SignUpProviderEmptyStateState extends State<SignUpProviderEmptyState> {
  // Initialize controller
  final SignUpProviderEmptyStateController signUpProviderEmptyStateController = Get.put(SignUpProviderEmptyStateController());
   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final GlobalKey<FormState> formKeyP = GlobalKey<FormState>();

   backClick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure ScreenUtil is initialized properly
    initializeScreenSize(context);

    return GetBuilder<SignUpProviderEmptyStateController>(
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          backClick();
          return false; // Prevent the default back navigation
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: formKeyP,
                         child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(30.h),
                  getCustomAppBar("Sign Up", () {
                    backClick();
                  }),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          getVerSpace(30.h),
                          getTextField("Name", "profile_icon.svg",
                              controller: nameController, validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please enter Name';
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          getTextField("Email Address", "email_icon.svg",
                              controller: emailController, validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter email address';
                            } else {
                              if (!RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(email)) {
                                return 'Please enter valid email address';
                              }
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          phone_number_field(mobileNumberController),
                          getVerSpace(28.h),
                          getTextField("Location", "location_icon.svg",
                              controller: locationController,
                              validator: (location) {
                            if (location == null || location.isEmpty) {
                              return 'Please select Location';
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          getTextField(
                              function: () {},
                              obsequrePermition:
                                  signUpProviderEmptyStateController.passVisibility,
                              "Password",
                              "lock_icon.svg",
                              suffixiconpermition: true,
                              controller: passwordController,
                              widget: GestureDetector(
                                  onTap: () {
                                    signUpProviderEmptyStateController
                                    .setPasswordVisibility();
                                    
                                  },
                                  child: getSvgImage(signUpProviderEmptyStateController
                                              .passVisibility
                                          ? "eye_icon.svg"
                                          : "selected_eye_icon.svg")
                                      .paddingOnly(
                                          top: 15.h,
                                          bottom: 17.h,
                                          right: 18.h)), validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter valid password';
                            }
                            return null;
                          }),
                          getVerSpace(28.h),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signUpProviderEmptyStateController.isChecked;
                                },
                                child: getSvgImage(
                                      signUpProviderEmptyStateController.isChecked                                              
                                        ? "select_cheak_button.svg"
                                        : "unselect_cheak_button.svg"),
                              ),
                              getHorSpace(10.h),
                              GestureDetector(
                                onTap: () {
                                  Constant.sendToNext(context,
                                      Routes.termsAndConditionScreenRoute);
                                },
                                child: getCustomFont(
                                    "I agree with Terms & Privacy",
                                    14.sp,
                                    grey40,
                                    1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          getVerSpace(54.h),
                          getCustomButton("Sign Up", () {
                            if (formKeyP.currentState!.validate() &&
                                signUpProviderEmptyStateController.isChecked == true) {
                              // PrefData.setIsSignIn(false);
                              Constant.sendToNext(
                                  context, Routes.verificationScreenRoute);
                            }
                          }),
                          getVerSpace(50.h),
                          Center(
                              child: getCustomFont("Sign up with", 16.sp,
                                  context.theme.primaryColor, 1,
                                  fontWeight: FontWeight.w400)),
                          getVerSpace(20.h),
                          Row(
                            children: [
                              google_facebook_ios_button("google_logo.svg"),
                              getHorSpace(30.h),
                              google_facebook_ios_button("facebook_logo.svg"),
                              getHorSpace(30.h),
                              google_facebook_ios_button("apple_logo.svg")
                            ],
                          ).paddingSymmetric(horizontal: 85.46.h),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: getRichtext("You already have an account?", " Login",
                        function: () {
                      backClick();
                    },
                        firstTextwidth: FontWeight.w400,
                        firsttextSize: 14.sp,
                        secondTextwidth: FontWeight.w500,
                        secondtextSize: 16.sp,
                        firsttextcolor: context.theme.primaryColor,
                        secondtextcolor: context.theme.primaryColor),
                  ).paddingOnly(bottom: 30.h),
                ],
              ).paddingOnly(left: 20.h, right: 20.h),
            )),
          )),
    );
  }
}
