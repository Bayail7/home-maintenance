import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/firestore_test_page.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/utils/pref_data.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';

class SignUpProviderEmptyState extends StatefulWidget {
  @override
  State<SignUpProviderEmptyState> createState() => _SignUpProviderEmptyStateState();
}

class _SignUpProviderEmptyStateState extends State<SignUpProviderEmptyState> {
  final SignUpProviderEmptyStateController signUpProviderEmptyStateController = 
  Get.put(SignUpProviderEmptyStateController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  
  final formKey = GlobalKey<FormState>();
  final AuthController authControllerSignUp = Get.put(AuthController());

  backClick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SignUpProviderEmptyStateController>(
      init: SignUpProviderEmptyStateController(),
      builder: (signInEmptyStateController) => WillPopScope(
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
                          }, decoration: InputDecoration(labelText: 'name')),
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
                          }, decoration: InputDecoration(labelText: 'email')),
                          getVerSpace(28.h),
                          phone_number_field(mobileNumberController),
                          getVerSpace(28.h),
                          getTextField("Location", "location_icon.svg",
                              controller: locationController,
                              validator: (location) {
                            if (location == null || location.isEmpty) {
                              return 'Please select location';
                            }
                            return null;
                          },
                              decoration:
                                  InputDecoration(labelText: 'location')),
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
                          },
                              decoration:
                                  InputDecoration(labelText: 'password')),
                          SizedBox(height: 20),
                          getVerSpace(28.h),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signUpProviderEmptyStateController.setCheakPos();
                                },
                                child: getSvgImage(
                                    signInEmptyStateController.cheak
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
                          getCustomButton("Sign Up", () async {
                            if (formKey.currentState!.validate() &&
                                signInEmptyStateController.cheak == true) {
                              final name = nameController.text;
                              final email = emailController.text;
                              final mobile = mobileNumberController.text;
                              final password = passwordController.text;
                              final location = locationController.text;
                              try {
                                // Create user with Firebase Authentication
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                String uid = userCredential.user!.uid;
                                // Save user data to Firestore
                                await FirestoreTestPageState.addProviderData(uid,
                                    name, email, mobile, location, password);
                                // Set user sign-in state and navigate
                                PrefData.setIsSignIn(true);
                                Constant.sendToNext(
                                    context, Routes.ProviderServiceScreenRoute);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                } else {
                                  print('Error: $e');
                                }
                              } catch (e) {
                                print('An error occurred: $e');
                              }
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
