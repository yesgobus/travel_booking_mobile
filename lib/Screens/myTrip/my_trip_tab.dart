import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Screens/myTrip/myTripWidget/trip_widget.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../config/routes/app_routes.dart';

class MyTripTab extends StatefulWidget {
  const MyTripTab({super.key});

  @override
  State<MyTripTab> createState() => _MyTripTabState();
}

class _MyTripTabState extends State<MyTripTab> {
  CarouselController buttonCarouselController = CarouselController();
  HomeController homeController = Get.put(HomeController());
  BookingController bookingController = Get.put(BookingController());
  PackageListController packageListController =
      Get.put(PackageListController());
  @override
  void initState() {
    bookingController.getMyTrip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: const TextWidget(
            text: 'My Trips',
            textSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Obx(
          () => bookingController.isLoading.value
              ? Helper.pageLoading()
              : bookingController.myTripList.isEmpty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'No booking yet',
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Start exploring for your next trip',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 20),
                          CarouselSlider(
                            items: List.generate(
                              homeController.destinationList.length,
                              (index) => destinationPics(index),
                            ),
                            carouselController: buttonCarouselController,
                            options: CarouselOptions(
                              viewportFraction: 0.85,
                              aspectRatio: 12 / 9,
                              initialPage: 1,
                            ),
                          ),
                          // const Spacer(),
                          // Padding(
                          //   padding:  EdgeInsets.symmetric(horizontal: Get.width/4),
                          //   child: AppButton.primaryButton(
                          //       onButtonPressed: () {}, title: "+ Add booking"),
                          // ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: "   Bookings",
                            textSize: 18,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 6),
                        Expanded(
                          child: ListView.builder(
                            itemCount: bookingController.myTripList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                child: TripDetailWidget(index: index),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
        ));
  }

  Widget destinationPics(index) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          packageListController
              .getPackage(
                  destination:
                      homeController.destinationList[index].destination!)
              .then((value) {});
        });
        homeController.endDestController.text =
            homeController.destinationList[index].destination!;
        Get.toNamed(AppRoutes.packageListing);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            "${homeController.destinationList[index].image}",
            fit: BoxFit.cover,
            height: 300,
            width: Get.width - 70,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.29,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.black.withOpacity(0.3),
              child: Text(
                homeController.destinationList[index].destination!,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: theme.colorScheme.onPrimary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
