import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/config/routes/app_routes.dart';
import 'package:travel_booking/config/routes/routes.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';
import '../home/homewidget/holiday_day_type.dart';
import 'packageListwidget/package_detail_widget.dart';
import 'packageListwidget/select_travel_modal.dart';

class PackageListPage extends StatefulWidget {
  const PackageListPage({super.key});

  @override
  State<PackageListPage> createState() => _PackageListPageState();
}

class _PackageListPageState extends State<PackageListPage> {
  PackageListController packageListController =
      Get.put(PackageListController());
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => packageListController.isLoading.value
          ? Helper.pageLoading()
          : SingleChildScrollView(
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset(
                        "assets/images/png/manali.png",
                        width: Get.width,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: AppColors.blackColor.withOpacity(0.3),
                        height: 180,
                        width: Get.width,
                        child: SafeArea(
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.arrow_back,
                                          color: AppColors.whiteColor)),
                                  TextWidget(
                                    text:
                                        "${homeController.endDestController.text} Packages",
                                    textSize: 20,
                                    color: AppColors.whiteColor,
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.arrow_back,
                                          color: AppColors.transparentColor)),
                                ],
                              ),
                              TextWidget(
                                  text:
                                      "${packageListController.packageTagline}",
                                  textSize: 12,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500),
                              const SizedBox(height: 12),
                              TextWidget(
                                  text:
                                      "${homeController.adultController.text} Adults, ${homeController.roomController.text} Room",
                                  textSize: 12,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500),
                              // Container(
                              //   child: TextWidget(
                              //     text: "Edit",
                              //     textSize: 16,
                              //     color: AppColors.primaryColor,
                              //   ),
                              //   decoration: BoxDecoration(
                              //       border: Border.all(color: AppColors.primaryColor),
                              //       borderRadius: BorderRadius.circular(4)),
                              //   padding:
                              //       EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              // ),
                              // const Spacer(),
                              // const SizedBox(height: 4),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 12, vertical: 8),
                              //   child: SelectHolidayType(
                              //     isBlackTheme: true,
                              //   ),
                              // ),
                              // const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      )
                    ]),
                    // const SizedBox(height: 12),
                    // SizedBox(
                    //   height: 50,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       filtertab(title: "Sort", icon: Icons.sort),
                    //       filtertab(title: "Filter", icon: Icons.tune),
                    //       filtertab(
                    //           title: "Duration",
                    //           icon: Icons.keyboard_arrow_down_rounded),
                    //       filtertab(
                    //           title: "Flights",
                    //           icon: Icons.keyboard_arrow_down_rounded),
                    //       filtertab(
                    //           title: "Budget",
                    //           icon: Icons.keyboard_arrow_down_rounded),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // Container(
                    //   color: AppColors.blackColor,
                    //   height: 50,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       const SizedBox(width: 12),
                    //       const Center(
                    //           child: TextWidget(
                    //         text: "ALL PACKAGES (115)",
                    //         textSize: 12,
                    //         color: AppColors.primaryColor,
                    //       )),
                    //       const SizedBox(width: 12),
                    //       Center(
                    //           child: TextWidget(
                    //         text: "ALL-INCLUSIVE(115)",
                    //         textSize: 12,
                    //         color: AppColors.whiteColor,
                    //       )),
                    //       const SizedBox(width: 12),
                    //       Center(
                    //           child: TextWidget(
                    //         text: "HONEYMOON(8)",
                    //         textSize: 12,
                    //         color: AppColors.whiteColor,
                    //       )),
                    //       const SizedBox(width: 12),
                    //       Center(
                    //           child: TextWidget(
                    //         text: "VILLAS(11)",
                    //         textSize: 12,
                    //         color: AppColors.whiteColor,
                    //       )),
                    //       const SizedBox(width: 12),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: packageListController.packageList.isEmpty
                          ? SizedBox(
                              height: Get.height,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.height / 3),
                                child: TextWidget(
                                    text: "No Package Found", textSize: 16),
                              ))
                          : packageList(),
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  Widget packageList() => Column(
        children: List.generate(
          packageListController.packageList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              child: PackageDetailWidget(
                index: index,
                isWishlisht: false,
              ),
              onTap: () {
                packageListController.selectTravelModal(
                  context: context,
                  index: index,
                  onTap: () {
                    // log(ind.toString());

                    packageListController.getItenary(
                        context: context,
                        destination: packageListController
                            .packageList[index].destination!,
                        hotelId:
                            packageListController.packageList[index].hotelId!,
                        packageId: packageListController.packageList[index].id!,
                        endDate: homeController.returnDatePost,
                        startDate: homeController.departureDatePost);
                  },
                );
              },
            ),
          ),
        ),
      );

  filtertab({required String title, required IconData icon}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(text: title, textSize: 16),
            const SizedBox(width: 8),
            Icon(
              icon,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
