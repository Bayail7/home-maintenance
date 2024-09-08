
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/view/booking_tab/histry_page.dart';
import 'package:service_hub_app/view/booking_tab/upcoming_page.dart';

import '../../controller/controller.dart';
import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import '../../utils/constantWidget.dart';
import 'draft_page.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  BookingScreenController bookingScreenController =
      Get.put(BookingScreenController());
  PageController pageController = PageController();
List bookingPage = [UpcomingPage(),HistryPage(),DraftPage()];
  backclick() {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<BookingScreenController>(
      init: BookingScreenController(),
      builder: (bookingScreenController) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(24.h),
            getCustomAppBar("Bookings", (){backclick();}).paddingSymmetric(horizontal: 20.h),
            getVerSpace(16.87.h),

            Container(
              height: 72.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                color: context.theme.focusColor,
              ),
              child: TabBar(
                unselectedLabelColor: Color(0XFF6E758A),
                padding: EdgeInsets.symmetric(
                    horizontal: 16.h, vertical: 16.h),
                labelStyle: TextStyle(
                    color:Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    fontFamily: Constant.fontsFamily),
                labelColor: buttonColor,
                unselectedLabelStyle: TextStyle(
                    color: Color(0XFF23408F),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    fontFamily: Constant.fontsFamily),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: ShapeDecoration(
                    color: buttonColor.withOpacity(0.10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.h))),
                controller: bookingScreenController.tabController,
                tabs: const [
                  Tab(
                    text: "Upcoming ",
                  ),
                  Tab(
                    text: "History",
                  ),
                  Tab(
                    text: "Draft ",
                  ),
                ],
                onTap: (value) {
                  bookingScreenController.pController.animateToPage(value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
              ),
            ).paddingSymmetric(horizontal: 16.h),
            getVerSpace(2.h),
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: bookingScreenController.pController,
                onPageChanged: (value) {
                  bookingScreenController.tabController.animateTo(
                      value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return bookingPage[index];
                },
              ),
            ),
            // Expanded(
            //     flex: 1,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8.h),
            //         color: context.theme.focusColor,
            //       ),
            //       child:
            //     ).paddingOnly(left: 16.h, right: 16.h))
          ],
        ),
      )
    );
  }
}
