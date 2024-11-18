import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Screens/detailProceedPayment/detailProceedWidget/promocode.dart';
import 'package:travel_booking/Screens/packageDetails/packageDetailsWidget/proceedToBookWidget.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../../utils/appcolors/app_colors.dart';

class ItenararyWidget extends StatefulWidget {
  const ItenararyWidget({super.key});

  @override
  State<ItenararyWidget> createState() => _ItenararyWidgetState();
}

class _ItenararyWidgetState extends State<ItenararyWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  HomeController homeController = Get.find();
  PackageListController packageListController =
      Get.put(PackageListController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(6)),
      child: TabBarView(
        controller: _tabController,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          dayPlans(),
          // const Center(
          //   child: Text('Tranfer'),
          // ),
          // const Center(
          //   child: Text('hotel'),
          // ),
          // const Center(
          //   child: Text('activity'),
          // ),
        ],
      ),
    );
  }

  dayPlans() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      itemCount: packageListController.hotelData.itinerary!.length + 2,
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            children: [
              const TextWidget(
                  text: "Day Plan", textSize: 18, fontWeight: FontWeight.w500),
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                color: AppColors.primaryColor.withOpacity(0.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text:
                          "Day 01 - ${packageListController.hotelData.hotel!.destination}",
                      textSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const Row(
                      children: [
                        TextWidget(text: "Included : ", textSize: 16),
                        Icon(Icons.domain),
                        TextWidget(text: " 1 Hotel", textSize: 16)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.grey2Color),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (packageListController.withFlight)
                          const Icon(Icons.airplanemode_active_outlined),
                        if (packageListController.withFlight)
                          const SizedBox(width: 8),
                        TextWidget(
                          text:
                              "Arrival In ${packageListController.hotelData.hotel!.destination}",
                          textSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    if (!packageListController.withFlight)
                      const SizedBox(height: 8),
                    if (!packageListController.withFlight)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: "Please Note : ",
                              textSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.redColor),
                          TextWidget(
                              text: "You need to reach goa on your own",
                              textSize: 13,
                              maxLine: 2,
                              color: AppColors.redColor),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text:
                            "${packageListController.hotelData.hotel!.checkIn}",
                        textSize: 14),
                    const SizedBox(height: 8),
                    Container(
                      height: 150,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              image: NetworkImage(packageListController
                                  .hotelData.hotel!.image!),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextWidget(
                            text:
                                "${packageListController.hotelData.hotel!.hotelName}",
                            textSize: 16,
                            fontWeight: FontWeight.w500),
                        const SizedBox(width: 8),
                        Icon(Icons.star,
                            color: AppColors.yellowColor, size: 16),
                        TextWidget(
                            text:
                                "(${packageListController.hotelData.hotel!.rating})",
                            textSize: 12)
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextWidget(
                        text:
                            "${packageListController.hotelData.hotel!.fullAddress}",
                        textSize: 14),
                    const SizedBox(height: 8),
                    TextWidget(
                        text:
                            "${packageListController.hotelData.hotel!.address}",
                        textSize: 14),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        TextWidget(
                            text:
                                "${homeController.departureDate} - ${homeController.returnDate}",
                            textSize: 14)
                      ],
                    ),
                    const SizedBox(height: 16),
                    // const Center(
                    //   child: TextWidget(
                    //     text: "CHANGE",
                    //     textSize: 15,
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColors.primaryColor,
                    //   ),
                    // ),
                    // const SizedBox(height: 16),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.grey2Color,
                          borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          TextWidget(
                              text:
                                  "${packageListController.hotelData.hotel!.roomName}",
                              textSize: 15,
                              fontWeight: FontWeight.w500),
                          SizedBox(height: 8),
                          Column(
                              children: List.generate(
                                  packageListController.hotelData.hotel!
                                      .additionalInfo!.length, (ind) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextWidget(
                                  text:
                                      "${packageListController.hotelData.hotel!.additionalInfo![ind]}",
                                  maxLine: 2,
                                  textSize: 13),
                            );
                          }))
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                color: Colors.black26,
                child: TextWidget(
                    maxLine: 3,
                    text:
                        "End Of Day - ${packageListController.hotelData.hotel!.eodInfo}",
                    textSize: 14),
              ),
              const SizedBox(height: 12),
              // if (index == 1)
              //   Container(
              //     margin: const EdgeInsets.only(top: 8),
              //     padding: const EdgeInsets.only(
              //         left: 16, right: 16, bottom: 8, top: 8),
              //     decoration: BoxDecoration(
              //         color: AppColors.blackColor,
              //         borderRadius: const BorderRadius.only(
              //           topLeft: Radius.circular(25),
              //           topRight: Radius.circular(25),
              //         )),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Column(
              //           children: [
              //             CircleAvatar(
              //               radius: 30,
              //               backgroundColor: AppColors.greenColor,
              //               child: Icon(
              //                 CupertinoIcons.chat_bubble_2,
              //                 size: 30,
              //                 color: AppColors.whiteColor,
              //               ),
              //             ),
              //             const SizedBox(height: 8),
              //             TextWidget(
              //                 text: "What's app",
              //                 color: AppColors.whiteColor,
              //                 textSize: 14)
              //           ],
              //         ),
              //         const SizedBox(width: 12),
              //         Container(
              //             color: AppColors.whiteColor, width: 1, height: 100),
              //         const SizedBox(width: 12),
              //         Column(
              //           children: [
              //             CircleAvatar(
              //                 radius: 30,
              //                 backgroundColor: AppColors.primaryColor,
              //                 child: Icon(
              //                   Icons.call,
              //                   size: 30,
              //                   color: AppColors.whiteColor,
              //                 )),
              //             const SizedBox(height: 8),
              //             TextWidget(
              //                 text: "Call Now",
              //                 color: AppColors.whiteColor,
              //                 textSize: 14)
              //           ],
              //         )
              //       ],
              //     ),
              //   )
            ],
          );
        }
        if (index == packageListController.hotelData.itinerary!.length + 1) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProceedToBookWidget(),
          );
        }
        int iIndex = index - 1;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: AppColors.primaryColor.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text:
                        "Day 0${index + 1} - ${packageListController.hotelData.hotel!.destination}",
                    textSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      TextWidget(text: "Included :", textSize: 16),
                      TextWidget(
                          text:
                              " ${packageListController.hotelData.itinerary![iIndex].activities}",
                          textSize: 16)
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 8),
            const Divider(),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text:
                        "${packageListController.hotelData.itinerary![iIndex].activitieAddress}",
                    textSize: 14,
                    maxLine: 3,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 150,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: NetworkImage(packageListController
                                .hotelData.itinerary![iIndex].image!),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 8),
                  TextWidget(
                      text:
                          "${packageListController.hotelData.itinerary![iIndex].title}",
                      textSize: 16,
                      fontWeight: FontWeight.w500),
                  const SizedBox(height: 8),
                  TextWidget(
                      text: packageListController
                          .hotelData.itinerary![iIndex].plan!,
                      maxLine: 15,
                      textSize: 14),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              color: Colors.black26,
              child: TextWidget(
                  maxLine: 3,
                  text:
                      "End Of Day - ${packageListController.hotelData.itinerary![iIndex].eodInfo}",
                  textSize: 14),
            ),
            const SizedBox(height: 12),
            // if (index == 1)
            //   Container(
            //     margin: const EdgeInsets.only(top: 8),
            //     padding: const EdgeInsets.only(
            //         left: 16, right: 16, bottom: 8, top: 8),
            //     decoration: BoxDecoration(
            //         color: AppColors.blackColor,
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(25),
            //           topRight: Radius.circular(25),
            //         )),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Column(
            //           children: [
            //             CircleAvatar(
            //               radius: 30,
            //               backgroundColor: AppColors.greenColor,
            //               child: Icon(
            //                 CupertinoIcons.chat_bubble_2,
            //                 size: 30,
            //                 color: AppColors.whiteColor,
            //               ),
            //             ),
            //             const SizedBox(height: 8),
            //             TextWidget(
            //                 text: "What's app",
            //                 color: AppColors.whiteColor,
            //                 textSize: 14)
            //           ],
            //         ),
            //         const SizedBox(width: 12),
            //         Container(
            //             color: AppColors.whiteColor, width: 1, height: 100),
            //         const SizedBox(width: 12),
            //         Column(
            //           children: [
            //             CircleAvatar(
            //                 radius: 30,
            //                 backgroundColor: AppColors.primaryColor,
            //                 child: Icon(
            //                   Icons.call,
            //                   size: 30,
            //                   color: AppColors.whiteColor,
            //                 )),
            //             const SizedBox(height: 8),
            //             TextWidget(
            //                 text: "Call Now",
            //                 color: AppColors.whiteColor,
            //                 textSize: 14)
            //           ],
            //         )
            //       ],
            //     ),
            //   )
          ],
        );
      },
    );
  }
}
