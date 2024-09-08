import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class ApplianceCategoriesScreen extends StatefulWidget {
  @override
  State<ApplianceCategoriesScreen> createState() =>
      _ApplianceCategoriesScreenState();
}

class _ApplianceCategoriesScreenState extends State<ApplianceCategoriesScreen> {
  // ApplianceCategoriesScreenController applianceCategoriesScreenController =
  //     Get.put(ApplianceCategoriesScreenController());
  TextEditingController searchController = TextEditingController();

  backclick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () async {
          backclick();
          return false;
        },
        child: SizedBox()
        // GetBuilder<ApplianceCategoriesScreenController>(
        //   init: ApplianceCategoriesScreenController(),
        //   builder: (applianceCategoriesScreenController) => Scaffold(
        //     backgroundColor: context.theme.scaffoldBackgroundColor,
        //     body: SafeArea(
        //       child: Column(
        //         children: [
        //           Container(
        //             color: context.theme.focusColor,
        //             child:
        //                 getSearchTextField(prefixFunction: (){backclick();},searchController, "Search Category")
        //                     .paddingSymmetric(horizontal: 16.h, vertical: 12.h),
        //           ),
        //           Expanded(
        //               child: Container(
        //             color: context.theme.focusColor,
        //             child: Column(
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         getSvgImage("cleaning_service_tag.svg"),
        //                         getHorSpace(10.h),
        //                         getCustomFont("Appliance Repair", 18.sp,
        //                             context.theme.primaryColor, 1,
        //                             fontWeight: FontWeight.w600, txtHeight: 1.h)
        //                       ],
        //                     ),
        //                     Row(
        //                       children: [
        //                         list_grid_button(() {
        //                           applianceCategoriesScreenController
        //                               .setGrid(false);
        //                         },
        //                             applianceCategoriesScreenController.grid
        //                                 ? "inactive_list_icon.svg"
        //                                 : "active_list_icon.svg",
        //                             applianceCategoriesScreenController.grid
        //                                 ? BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(8.h),
        //                                     color: Color(0XFFF7F7F7))
        //                                 : BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(8.h),
        //                                     boxShadow: [
        //                                         BoxShadow(
        //                                             offset: Offset(0, 8),
        //                                             blurRadius: 8,
        //                                             spreadRadius: -4,
        //                                             color: regularBlack
        //                                                 .withOpacity(0.10)),
        //                                       ])),
        //                         getHorSpace(8.h),
        //                         list_grid_button(() {
        //                           applianceCategoriesScreenController
        //                               .setGrid(true);
        //                         },
        //                             applianceCategoriesScreenController.grid
        //                                 ? "active_grid_icon.svg"
        //                                 : "inactive_grid_icon.svg",
        //                             applianceCategoriesScreenController.grid
        //                                 ? BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(8.h),
        //                                     boxShadow: [
        //                                         BoxShadow(
        //                                             offset: Offset(0, 8),
        //                                             blurRadius: 8,
        //                                             spreadRadius: -4,
        //                                             color: regularBlack
        //                                                 .withOpacity(0.10))
        //                                       ])
        //                                 : BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(8.h),
        //                                     color: Color(0XFFF7F7F7))),
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //                 getVerSpace(20.h),
        //                 Expanded(
        //                   child: Container(
        //                     child: GridView.builder(
        //                       itemCount: applianceCategoriesScreenController
        //                           .allianceData.length,
        //                       gridDelegate:
        //                           SliverGridDelegateWithFixedCrossAxisCount(
        //                               crossAxisCount:
        //                                   applianceCategoriesScreenController
        //                                           .grid
        //                                       ? 2
        //                                       : 1,
        //                               mainAxisSpacing:
        //                                   applianceCategoriesScreenController
        //                                           .grid
        //                                       ? 24.h
        //                                       : 12.h,
        //                               crossAxisSpacing:
        //                                   applianceCategoriesScreenController
        //                                           .grid
        //                                       ? 14.4.h
        //                                       : 0,
        //                               mainAxisExtent:
        //                                   applianceCategoriesScreenController
        //                                           .grid
        //                                       ? 236.92.h
        //                                       : 127.h),
        //                       itemBuilder: (context, index) {
        //                         AllianceData alliance =
        //                             applianceCategoriesScreenController
        //                                 .allianceData[index];
        //                         return applianceCategoriesScreenController.grid
        //                             ? GestureDetector(
        //                           onTap: (){
        //                             Constant.sendToNext(context, Routes.AcRepairServiceDetailScreenRoute);
        //                           },
        //                               child: Container(
        //                                   child: Column(
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       Container(
        //                                         width: double.infinity,
        //                                         height: 165.21.h,
        //                                         decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(14.h),
        //                                         ),
        //                                         child: getAssetImage(
        //                                             alliance.image!,
        //                                             boxFit: BoxFit.fill),
        //                                       ),
        //                                       getVerSpace(8.h),
        //                                       getCustomFont(
        //                                           alliance.serviceName!,
        //                                           15.sp,
        //                                           context.theme.primaryColor,
        //                                           1,
        //                                           fontWeight: FontWeight.w600),
        //                                       getVerSpace(2.h),
        //                                       getCustomFont("Starts From", 12.sp,
        //                                           Color(0XFF9A9FA5), 1,
        //                                           fontWeight: FontWeight.w500),
        //                                       getVerSpace(6.h),
        //                                       Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment
        //                                                 .spaceBetween,
        //                                         children: [
        //                                           Container(
        //                                             height: 24.h,
        //                                             width: 41.h,
        //                                             decoration: BoxDecoration(
        //                                                 borderRadius:
        //                                                     BorderRadius.circular(
        //                                                         6.h),
        //                                                 color: Color(0XFFB5E4CA)),
        //                                             child: Center(
        //                                                 child: getCustomFont(
        //                                                     "\$${alliance.rate!}",
        //                                                     12.sp,
        //                                                     context.theme
        //                                                         .primaryColor,
        //                                                     1,
        //                                                     fontWeight:
        //                                                         FontWeight.w700)),
        //                                           ),
        //                                           Container(
        //                                               height: 24.h,
        //                                               width: 51.h,
        //                                               decoration: BoxDecoration(
        //                                                   borderRadius:
        //                                                       BorderRadius
        //                                                           .circular(
        //                                                               100.h),
        //                                                   color: Color(0XFFFFC554)
        //                                                       .withOpacity(0.10)),
        //                                               child: Row(
        //                                                 mainAxisAlignment:
        //                                                     MainAxisAlignment
        //                                                         .center,
        //                                                 children: [
        //                                                   getSvgImage(
        //                                                       "star_icon.svg"),
        //                                                   getHorSpace(5.h),
        //                                                   getCustomFont(
        //                                                       alliance.ratting!,
        //                                                       12.sp,
        //                                                       context.theme
        //                                                           .primaryColor,
        //                                                       1,
        //                                                       fontWeight:
        //                                                           FontWeight.w700)
        //                                                 ],
        //                                               ))
        //                                         ],
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                             )
        //                             : GestureDetector(
        //                           onTap: (){
        //                             Constant.sendToNext(context, Routes.AcRepairServiceDetailScreenRoute);
        //                           },
        //                               child: Container(
        //                                   decoration: BoxDecoration(
        //                                       border: Border(
        //                                           bottom: BorderSide(
        //                                               color: index ==
        //                                                       applianceCategoriesScreenController
        //                                                               .allianceData
        //                                                               .length -
        //                                                           1
        //                                                   ? context
        //                                                       .theme.focusColor
        //                                                   : greyButton))),
        //                                   child: Row(
        //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                     children: [
        //                                       Row(
        //                                         children: [
        //                                           Container(
        //                                             width: 105.h,
        //                                             height: 116.h,
        //                                             decoration: BoxDecoration(
        //                                               borderRadius:
        //                                                   BorderRadius.circular(
        //                                                       14.h),
        //                                             ),
        //                                             child: getAssetImage(
        //                                                 alliance.image!,
        //                                                 boxFit: BoxFit.fill),
        //                                           ),
        //                                           getHorSpace(16.h),
        //                                           Column(
        //                                             crossAxisAlignment:
        //                                                 CrossAxisAlignment.start,
        //                                             children: [
        //                                               Row(
        //                                                 children: [
        //                                                   getSvgImage(
        //                                                       "star_icon.svg"),
        //                                                   getHorSpace(5.h),
        //                                                   getCustomFont(
        //                                                       alliance.ratting!,
        //                                                       12.sp,
        //                                                       context.theme
        //                                                           .primaryColor,
        //                                                       1,
        //                                                       fontWeight:
        //                                                           FontWeight
        //                                                               .w700),
        //                                                   getCustomFont(
        //                                                       "(87)",
        //                                                       12.sp,
        //                                                       Color(0XFF6F767E),
        //                                                       1,
        //                                                       fontWeight:
        //                                                           FontWeight
        //                                                               .w700),
        //                                                 ],
        //                                               ),
        //                                               getVerSpace(8.h),
        //                                               getCustomFont(
        //                                                   alliance.serviceName!,
        //                                                   14.sp,
        //                                                   context
        //                                                       .theme.primaryColor,
        //                                                   1,
        //                                                   fontWeight:
        //                                                       FontWeight.w600),
        //                                               getVerSpace(7.h),
        //                                               getCustomFont("Starts From", 12.sp, neutralShades, 1,fontWeight: FontWeight.w500),
        //                                               getVerSpace(10.h),
        //                                               Container(
        //                                                 height: 24.h,
        //                                                 width: 41.h,
        //                                                 decoration: BoxDecoration(
        //                                                     borderRadius:
        //                                                     BorderRadius.circular(
        //                                                         6.h),
        //                                                     color: Color(0XFFB5E4CA)),
        //                                                 child: Center(
        //                                                     child: getCustomFont(
        //                                                         "\$${alliance.rate!}",
        //                                                         12.sp,
        //                                                         context.theme
        //                                                             .primaryColor,
        //                                                         1,
        //                                                         fontWeight:
        //                                                         FontWeight.w700)),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         ],
        //                                       ),
        //                                       getSvgImage("more_hor_rounded.svg")
        //                                     ],
        //                                   ).paddingOnly(bottom: 10.h),
        //                                 ),
        //                             );
        //                       },
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ).paddingAll(16.h),
        //           ).paddingSymmetric(horizontal: 17.h, vertical: 17.h))
        //         ],
        //       ),
        //     ),
        //   ),
        // )
        );
  }

  Widget list_grid_button(function, icon, Decoration boxdecoration) {
    return GestureDetector(
      onTap: () {
        function();
        //
      },
      child: Container(
        height: 36.h,
        width: 36.h,
        decoration: boxdecoration,
        child: getSvgImage(icon).paddingAll(8.h),
      ),
    );
  }
}
