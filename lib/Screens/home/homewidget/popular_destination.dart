import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/config/routes/routes.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../../config/routes/app_routes.dart';
import 'destination_card_widget.dart';

class PopularDestination extends StatefulWidget {
  const PopularDestination({super.key});

  @override
  State<PopularDestination> createState() => _PopularDestinationState();
}

class _PopularDestinationState extends State<PopularDestination> {
  HomeController homeController = Get.put(HomeController());
  PackageListController packageListController =
      Get.put(PackageListController());
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Destinations',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(AppRoutes.packageListing);
              //   },
              //   child: TextWidget(
              //     text: 'See all',
              //     textSize: 15,
              //     color: AppColors.black65,
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: homeController.destinationList.length,
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
                        homeController.destinationList[index].destination!;
                    Get.toNamed(AppRoutes.packageListing);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    width: Get.width / 2.5,
                    child: DestinationCard(
                      destinationName:
                          homeController.destinationList[index].destination!,
                      rating: double.parse(homeController
                          .destinationList[index].rating
                          .toString()),
                      price:
                          homeController.destinationList[index].startingPrice!,
                      imagePath: homeController.destinationList[index]
                          .image!, // Replace with actual path
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
