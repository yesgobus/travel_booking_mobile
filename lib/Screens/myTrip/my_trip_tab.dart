import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Screens/myTrip/myTripWidget/trip_widget.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../config/routes/app_routes.dart';

class MyTripTab extends StatefulWidget {
  const MyTripTab({super.key});

  @override
  State<MyTripTab> createState() => _MyTripTabState();
}

class _MyTripTabState extends State<MyTripTab> {
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
              ? const Center(child: CircularProgressIndicator())
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
                // Instead of CarouselSlider, use a simple ListView or GridView for displaying destinations.
                // Here we are using a ListView.
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.destinationList.length,
                    itemBuilder: (context, index) {
                      return destinationPics(index);
                    },
                  ),
                ),
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
              const SizedBox(height: 6),
              Expanded(
                child: ListView.builder(
                  itemCount: bookingController.myTripList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TripDetailWidget(index: index),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget destinationPics(int index) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        packageListController
            .getPackage(
            destination: homeController.destinationList[index].destination!)
            .then((value) {});
        homeController.endDestController.text =
        homeController.destinationList[index].destination!;
        Get.toNamed(AppRoutes.packageListing);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(homeController.destinationList[index].image!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 180,
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
      ),
    );
  }
}
