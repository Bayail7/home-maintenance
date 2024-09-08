
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/pref_data.dart';

class SignInEmptyState extends StatefulWidget {
  @override
  State<SignInEmptyState> createState() => _SignInEmptyStateState();
}

class _SignInEmptyStateState extends State<SignInEmptyState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  SignInEmptyStateController signInEmptyStateController =
      Get.put(SignInEmptyStateController());
  final loginForm = GlobalKey<FormState>();

  backClick() {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SignInEmptyStateController>(
      init: SignInEmptyStateController(),
      builder: (signInEmptyStateController) => WillPopScope(
          onWillPop: () async {
            backClick();
            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
                child: Form(
              key: loginForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      getVerSpace(30.h),
                      getCustomFont(
                          "Sign in", 24.h, context.theme.primaryColor, 1,
                          fontWeight: FontWeight.w700),
                      getVerSpace(30.h),
                      getTextField("Email", "email_icon.svg",function: (){},
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
                      getTextField(
                          function: () {},
                          obsequrePermition:
                              signInEmptyStateController.passVisibility,
                          "Password",
                          "lock_icon.svg",
                          suffixiconpermition: true,
                          controller: passWordController,
                          widget: GestureDetector(
                              onTap: () {
                                signInEmptyStateController
                                    .setPasswordVisibility();
                              },
                              child: getSvgImage(
                                      signInEmptyStateController.passVisibility
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
                      getVerSpace(24.h),
                      GestureDetector(
                          onTap: () {
                            Constant.sendToNext(
                                context, Routes.forgotPasswordEmptyStateRoute);
                          },
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: getCustomFont("Forgot Password?", 16.sp,
                                  context.theme.primaryColor, 1,
                                  fontWeight: FontWeight.w400))),
                      getVerSpace(50.h),
                      getCustomButton("Sign In", () {
                        // Constant.sendToNext(context, Routes.homeMainScreenRoute);
                        if (loginForm.currentState!.validate()) {
                          PrefData.setIsSignIn(false);
                          Constant.sendToNext(
                              context, Routes.homeMainScreenRoute);
                        }
                      }),
                      getVerSpace(50.h),
                      Center(
                          child: getCustomFont("Sign in with", 16.sp,
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
                  )),
                  Center(
                    child: getRichtext("Don’t have an account?", " Sign up",
                        function: () {
                      Constant.sendToNext(context, Routes.sinUpEmptyStateRoute);
                    },
                        firstTextwidth: FontWeight.w400,
                        firsttextSize: 14.sp,
                        secondTextwidth: FontWeight.w500,
                        secondtextSize: 16.sp,
                        firsttextcolor: context.theme.primaryColor,
                        secondtextcolor: context.theme.primaryColor),
                  ).paddingOnly(bottom: 30.h),
                ],
              ).paddingSymmetric(horizontal: 20.h),
            )),
          )),
    );
  }
}
