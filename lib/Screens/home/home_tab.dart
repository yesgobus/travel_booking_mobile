import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../config/routes/app_routes.dart';
import 'homewidget/holiday_day_type.dart';
import 'homewidget/home_app_bar.dart';
import 'homewidget/popular_destination.dart';
import 'homewidget/search_destination.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeController homeController = Get.put(HomeController());
  PackageListController packageListController =
      Get.put(PackageListController());
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      homeController.getTodaysOffers().then((onValue) {
        // setState(() {});
      });
      homeController.getPopularDestination().then((onValue) {
        // setState(() {});
      });
      homeController.getCustomerReview().then((value) {
        // setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1Color,
      body: SingleChildScrollView(
          child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(PngAssetPath.home_bgImg),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              child: const SafeArea(
                child: Column(
                  children: [
                    HomeAppBar(),
                    // HolidayTypeWidget(),
                    SearchDestinationWidget(),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(12),
            //   padding: EdgeInsets.all(12),
            //   decoration: BoxDecoration(
            //       color: AppColors.whiteColor,
            //       borderRadius: BorderRadius.circular(8)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         children: [
            //           Image.asset(
            //             PngAssetPath.car,
            //             height: 40,
            //           ),
            //           SizedBox(height: 6),
            //           TextWidget(text: "Free Transport", textSize: 12)
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           Image.asset(
            //             PngAssetPath.guid,
            //             height: 40,
            //           ),
            //           SizedBox(height: 6),
            //           TextWidget(text: "Guide Support", textSize: 12)
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           Image.asset(
            //             PngAssetPath.offer,
            //             height: 40,
            //           ),
            //           SizedBox(height: 6),
            //           TextWidget(text: "Offers", textSize: 12)
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           Image.asset(
            //             PngAssetPath.ticket,
            //             height: 40,
            //           ),
            //           SizedBox(height: 6),
            //           TextWidget(text: "Buy 1 Get 1", textSize: 12)
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
              child: TextWidget(
                  text: "Today's Offers",
                  textSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            homeController.isLoading.value
                ? Helper.pageLoading()
                : SizedBox(
                    height: 175,
                    child: ListView.builder(
                      itemCount: homeController.offersdata.length,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              packageListController
                                  .getPackage(
                                      destination: homeController
                                          .destinationList[index].destination!)
                                  .then((value) {});
                            });
                            homeController.endDestController.text =
                                homeController
                                    .destinationList[index].destination!;
                            Get.toNamed(AppRoutes.packageListing);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            width: Get.width / 1.8,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(homeController
                                                .offersdata[index].image!),
                                            fit: BoxFit.cover))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          text:
                                              "${homeController.offersdata[index].offerFor}",
                                          maxLine: 2,
                                          textSize: 12,
                                          fontWeight: FontWeight.w500),
                                      SizedBox(height: 6),
                                      TextWidget(
                                          text:
                                              "Offer Valid till: ${homeController.offersdata[index].validTill}",
                                          textSize: 10,
                                          color: AppColors.black45),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

            homeController.isLoading2.value
                ? Helper.pageLoading()
                : const PopularDestination(),
            if (homeController.feedbackData.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: TextWidget(
                    text: "Customer Reviews",
                    textSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            
              homeController.isLoading3.value
                  ? Helper.pageLoading()
                  : SizedBox(
                      height: homeController.feedbackData.isNotEmpty?110:0,
                      child: ListView.builder(
                        itemCount: homeController.feedbackData.length,
                        padding: EdgeInsets.only(left: 12, right: 12),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            width: Get.width / 1.3,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.greenColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 4),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: AppColors.whiteColor,
                                          ),
                                          SizedBox(width: 4),
                                          TextWidget(
                                            text:
                                                "${homeController.feedbackData[index].rating}",
                                            textSize: 14,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: TextWidget(
                                        text:
                                            "${homeController.feedbackData[index].userId!.name}",
                                        textSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8),
                                TextWidget(
                                  text:
                                      "Travelled to ${homeController.feedbackData[index].destination} on ${homeController.feedbackData[index].feedbackDate} with ${homeController.feedbackData[index].totalGuest} People.",
                                  textSize: 11,
                                  maxLine: 2,
                                  color: AppColors.black45,
                                ),
                                SizedBox(height: 8),
                                TextWidget(
                                  text:
                                      "${homeController.feedbackData[index].feedback}",
                                  textSize: 12,
                                  maxLine: 5,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            SizedBox(height: 12)
          ],
        ),
      )),
    );
  }
}
