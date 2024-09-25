import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/controller/controller.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/view/sign_in/sign_in_empty_state.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_category.dart';
import '../../utils/constantWidget.dart';
import '../../utils/pref_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class ProviderProfileScreen extends StatefulWidget {
  @override
  State<ProviderProfileScreen> createState() => _ProviderProfileScreenState();
}

backClick() {
  Constant.closeApp();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
  SideMenuProfifileScreenController sideMenuProfifileScreenController = Get.put(SideMenuProfifileScreenController());
  String major = ''; // Variable to store user's major

  @override
  void initState() {
    super.initState();
    _loadMajor(); // Load the major when the screen initializes
  }

  // Load major from SharedPreferences
  void _loadMajor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      major = prefs.getString('user_major') ?? ''; // Load existing major
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuNotificationScreenController>(
      init: SideMenuNotificationScreenController(),
      builder: (sideMenuNotificationScreenController) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Column(
                children: [
                  getVerSpace(30.h),
                  getAssetImage("user_image.png", height: 100.h, width: 100.w),
                  getVerSpace(20.h),
                  getCustomFont("John Doe", 18.sp, Color(0XFF000000), 1, fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                  getVerSpace(8.h),
                  getCustomFont("johndoe@gmail.com", 16.sp, Color(0XFF808080), 1, fontWeight: FontWeight.w500),
                  getVerSpace(20.h),
                  getProfileOption("profile_icon.svg", "My Profile", () {
                  Constant.sendToNext(context, Routes.providerMyProfileScreenRoute);                  }),
                  getVerSpace(20.h),
                  getProfileOption("unselected_address_icon_lt.svg", "My Address", () {
                    SideMenuProfifileScreenController.addAddessScreen(false);
                    Constant.sendToNext(context, Routes.sideMenuAddressScreenRoute);
                  }),
                  getVerSpace(20.h),
                  getProfileOption("major_icon.png", "My Major", () {
                    _showMajorInputDialog(); // Function to show input dialog for major
                  }),
                  getVerSpace(20.h),
                  getCustomFont(major.isNotEmpty ? major : "No Major Set", 16.sp, Color(0XFF808080), 1, fontWeight: FontWeight.w500),
                  getVerSpace(20.h),
                  getProfileOption("setting_icon.svg", "Settings", () {
                    Constant.sendToNext(context, Routes.settingScreensRoute);
                  }),
                  getVerSpace(41.h),
                ],
              ),
              getVerSpace(20.h),
              getCustomButton(
                "Logout",
                () {
                  Get.defaultDialog(
                    barrierDismissible: false,
                    title: '',
                    content: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        children: [
                          getCustomFont("Are you sure you want to Logout!", 24.sp, Color(0XFF000000), 2,
                              fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h, bottom: 13.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: getCustomButton("Yes", () {
                                    PrefData.setIsSignIn(true);
                                    Get.off(SignInEmptyState());
                                  },
                                  buttonheight: 50.h),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: getCustomButton("No", () {
                                    Get.back();
                                  },
                                  color: buttonColor,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: buttonColor, style: BorderStyle.solid, width: 1.0.w),
                                    borderRadius: BorderRadius.circular(40.h),
                                  ),
                                  buttonheight: 50.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 20.h),
        ),
      ),
    );
  }

  void _showMajorInputDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String existingMajor = prefs.getString('user_major') ?? ''; // Load existing major

    TextEditingController majorController = TextEditingController(text: existingMajor);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Your Major'),
          content: TextField(
            controller: majorController,
            decoration: InputDecoration(hintText: "Enter your major"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                String newMajor = majorController.text;
                await prefs.setString('user_major', newMajor); // Save the new major
                setState(() {
                  major = newMajor; // Update the state variable
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}