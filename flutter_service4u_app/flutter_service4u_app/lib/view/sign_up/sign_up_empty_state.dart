import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/current_location_screen.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import 'package:service_hub_app/utils/pref_data.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '/firestore_test_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SinUpEmptyState extends StatefulWidget {
  @override
  State<SinUpEmptyState> createState() => _SinUpEmptyStateState();
}

class _SinUpEmptyStateState extends State<SinUpEmptyState> {
  SinUpEmptyStateController sinUpEmptyStateController =
      Get.put(SinUpEmptyStateController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthController authControllerSignUp = Get.put(AuthController());
final GlobalKey<ScaffoldState> signUpScaffoldKey = GlobalKey<ScaffoldState>();
  backClick() {
    Constant.backToFinish();
  }
void _setLocation(String location) {
    setState(() {
      locationController.text = location;
    });
  }
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<SinUpEmptyStateController>(
      init: SinUpEmptyStateController(),
      builder: (sinUpEmptyStateController) => WillPopScope(
          onWillPop: () async {
            backClick();
            return false;
          },
          child: Scaffold(
              key: signUpScaffoldKey, 
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
                          getVerSpace(20.h),
                          
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return CurrentLocationScreen(
                            onLocationSelected: _setLocation,
                          );
                        },
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/location_icon.svg',
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: Constant.fontsFamily,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: grey40,
                      backgroundColor: Colors.grey[100],
                      minimumSize: Size(50, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.h),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(labelText: 'Location'),
                    readOnly: true, // User cannot manually input location
                  ),
                          getVerSpace(20.h),
                          getTextField(
                              function: () {},
                              obsequrePermition:
                                  sinUpEmptyStateController.passVisibility,
                              "Password",
                              "lock_icon.svg",
                              suffixiconpermition: true,
                              controller: passwordController,
                              widget: GestureDetector(
                                  onTap: () {
                                    sinUpEmptyStateController
                                        .setPasswordVisibility();
                                  },
                                  child: getSvgImage(sinUpEmptyStateController
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
                          getVerSpace(10.h),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  sinUpEmptyStateController.setCheakPos();
                                },
                                child: getSvgImage(
                                    sinUpEmptyStateController.cheak
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
                                sinUpEmptyStateController.cheak == true) {
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
                                await FirestoreTestPageState.addUserData(uid,
                                    name, email, mobile, location, password);
                                // Set user sign-in state and navigate
                                PrefData.setIsSignIn(true);
                                Constant.sendToNext(
                                    context, Routes.homeMainScreenRoute);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
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
