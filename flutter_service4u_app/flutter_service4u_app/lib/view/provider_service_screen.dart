import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/utils/color_category.dart';
import 'package:service_hub_app/view/notification_tab/provider_notification_screen.dart';
import 'package:service_hub_app/view/provider_profile_tab/provider_profile_screen.dart';
import 'package:service_hub_app/view/provider_profile_tab/new_orders_screen.dart';
import '../controller/controller.dart';
import 'package:service_hub_app/utils/constant.dart';
import 'package:service_hub_app/utils/constantWidget.dart';
import '../utils/drawe_data.dart';
import 'booking_tab/booking_tab_screen.dart';

class ProviderServiceScreen extends StatefulWidget {
  const ProviderServiceScreen({Key? key}) : super(key: key);

  @override
  State<ProviderServiceScreen> createState() => _ProviderServiceScreenState();
}

class _ProviderServiceScreenState extends State<ProviderServiceScreen> {
  final ProviderServiceScreenController providerServiceScreenController =
      Get.put(ProviderServiceScreenController());

  void closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<ProviderServiceScreenController>(
      init: ProviderServiceScreenController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          closeApp();
          return false;
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          key: ProviderServiceScreenController.drawerKey,
          drawer: Drawer(child: DrawerData()), // Ensure DrawerData is implemented
          body: _body(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 27),
                  color: regularBlack.withOpacity(0.04),
                  spreadRadius: -4,
                  blurRadius: 12,
                ),
              ],
            ),
            child: ClipRRect(
              child: BottomNavigationBar(
                backgroundColor: const Color(0XFFFFFFFF),
                currentIndex: controller.position.value,
                onTap: (index) {
                  controller.onChange(index);
                },
                type: BottomNavigationBarType.fixed,
                items: [
                     // New Order Navigation Item
                  BottomNavigationBarItem(
                    activeIcon: Column(
                      children: [
                        getSvgImage("selected_order.svg"), // Add your SVG icon for selected
                        getVerSpace(4.h),
                        getSvgImage("blue_line_hor.svg"),
                      ],
                    ),
                    icon: getSvgImage("order_icon.svg"), // Add your SVG icon for unselected
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Column(
                      children: [
                        getSvgImage("select_booking_icon.svg"),
                        getVerSpace(4.h),
                        getSvgImage("blue_line_hor.svg"),
                      ],
                    ),
                    icon: getSvgImage("unselect_booking_icon.svg"),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Column(
                      children: [
                        getSvgImage("selected_notification_icon.svg"),
                        getVerSpace(4.h),
                        getSvgImage("blue_line_hor.svg"),
                      ],
                    ),
                    icon: getSvgImage("unselected_notification_icon.svg"),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Column(
                      children: [
                        getSvgImage("selected_profile_icon.svg"),
                        getVerSpace(4.h),
                        getSvgImage("blue_line_hor.svg"),
                      ],
                    ),
                    icon: getSvgImage("profile_icon.svg"),
                    label: '',
                  ),
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    switch (providerServiceScreenController.position.value) {
      case 0:
       return NewOrdersScreen(); // Return the new Order screen
       
      case 1:
       return BookingScreen();
      case 2:
              return ProviderNotificationScreen();
      case 3: // New case for Order
               return ProviderProfileScreen();

      default:
        return const Center(
          child: Text("Invalid"),
        );
    }
  }
}