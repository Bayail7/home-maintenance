import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/models/electronics_categories_data_model.dart';
import 'package:service_hub_app/utils/color_category.dart';
import '../../../../controller/controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/constantWidget.dart';

class ElectronicsScreen extends StatefulWidget {
  @override
  State<ElectronicsScreen> createState() => _ElectronicsScreenState();
}

class _ElectronicsScreenState extends State<ElectronicsScreen> {
  ElectronicsRepairScreenController ElectronicsScreenController =
      Get.put(ElectronicsRepairScreenController());
  TextEditingController searchController = TextEditingController();

  backclick() {
    Constant.backToFinish();
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<ElectronicsRepairScreenController>(
        init: ElectronicsRepairScreenController(),
        builder: (electronicsScreenController) => WillPopScope(
            onWillPop: () async {
              backclick();
              return false;
            },
            child: Scaffold(
              body: SafeArea(
                child: all_service_categories_screen_formate(
                    "Electricity Repair",
                    () {
                      ElectronicsScreenController.setList();
                    },
                    ElectronicsScreenController.list,
                    () {
                      ElectronicsScreenController.setGrid();
                    },
                    ElectronicsScreenController.grid,
                    GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          ElectronicsScreenController.allElectronicsService.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              electronicsScreenController.list ? 1 : 2,
                          mainAxisSpacing: 24.h,
                          crossAxisSpacing:
                              electronicsScreenController.list ? 0 : 20.h,
                          mainAxisExtent:
                              electronicsScreenController.list ? 110 : 203.h),
                      itemBuilder: (BuildContext context, int index) {
                        ElectronicsService service = ElectronicsScreenController
                            .allElectronicsService[index];
                        return electronicsScreenController.list
                            ? animation_function(
                                index,
                                GestureDetector(
                                  onTap: () {
                                      Constant.sendToNext(
                                        context,
                                        Routes
                                            .acRepairServiceDetailScreenRoute,
                                      arguments: {
                                          // service.title
                                          'title': service.title,
                                          'price': service.price,
                                          'rating': service.rating
                                          }
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.h),
                                        border: Border.all(color: grey20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 102.h,
                                              width: 101.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.h),
                                                  image: DecorationImage(
                                                      image: AssetImage(Constant
                                                              .assetImagePath +
                                                          service.image!),
                                                      fit: BoxFit.fill)),
                                            ),
                                            getHorSpace(10.h),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                getCustomFont(service.title!,
                                                    14.sp, regularBlack, 1,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                getVerSpace(4.h),
                                                getCustomFont(
                                                    "\$${service.price}",
                                                    14.sp,
                                                    regularBlack,
                                                    1,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                getVerSpace(12.h),
                                                Center(
                                                  child: Row(
                                                    children: [
                                                      getSvgImage(
                                                          "star_icon.svg"),
                                                      getHorSpace(6.h),
                                                      Center(
                                                        child: getCustomFont(
                                                            service.rating!,
                                                            14.sp,
                                                            regularBlack,
                                                            1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        service.discount == ""
                                            ? SizedBox()
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(),
                                                  getCustomFont(
                                                      "Off ${service.discount}%",
                                                      14.sp,
                                                      grey40,
                                                      1,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ).paddingOnly(
                                                right: 12.h, bottom: 24.h)
                                      ],
                                    ).paddingSymmetric(
                                        vertical: 4.h, horizontal: 4.h),
                                  ),
                                ),
                              )
                            : animation_function(
                                index,
                                GestureDetector(
                                  onTap: () {
                                     Constant.sendToNext(
                                        context,
                                        Routes
                                            .acRepairServiceDetailScreenRoute,
                                      arguments: {
                                          // service.title
                                          'title': service.title,
                                          'price': service.price,
                                          'rating': service.rating
                                          },
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 146.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.h),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    Constant.assetImagePath +
                                                        service.image!),
                                                fit: BoxFit.fill)),
                                      ),
                                      getVerSpace(12.h),
                                      getCustomFont(service.title!, 14.sp,
                                          regularBlack, 1,
                                          fontWeight: FontWeight.w700),
                                      getVerSpace(4.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getCustomFont("\$${service.price}",
                                              14.sp, regularBlack, 1,
                                              fontWeight: FontWeight.w400),
                                          Container(
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                getSvgImage("star_icon.svg",
                                                    height: 16.h, width: 16.h),
                                                getHorSpace(2.h),
                                                getCustomFont(service.rating!,
                                                    14.sp, regularBlack, 1,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    )),
              ),
            )));
  }
}
