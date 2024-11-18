import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Screens/packageDetails/packageDetailsWidget/itineraryWidget.dart';
import 'package:travel_booking/widget/buttons/button.dart';

import '../../utils/appcolors/app_colors.dart';
import '../../widget/textwidget/text_widget.dart';
import '../home/homewidget/holiday_day_type.dart';
import 'packageDetailsWidget/proceedToBookWidget.dart';

class PackageDescrptionPage extends StatefulWidget {
  const PackageDescrptionPage({super.key});

  @override
  State<PackageDescrptionPage> createState() => _PackageDescrptionPageState();
}

class _PackageDescrptionPageState extends State<PackageDescrptionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  PackageListController packageListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Stack(children: [
                Image.network(
                  packageListController.selectedPackage.image!,
                  width: Get.width,
                  height: 230,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: AppColors.blackColor.withOpacity(0.3),
                  height: 230,
                  width: Get.width,
                  child: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: AppColors.whiteColor)),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextWidget(
                                  text:
                                      "Amazing ${packageListController.selectedPackage.destination} ${packageListController.withFlight == true ? "Flight" : "Without Flight"} Inclusive Deal ${packageListController.selectedPackage.totalDuration}",
                                  fontWeight: FontWeight.w500,
                                  textSize: 20,
                                  maxLine: 2,
                                  align: TextAlign.center,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: null,
                                icon: Icon(Icons.arrow_back,
                                    color: AppColors.transparentColor)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextWidget(
                            text: "${packageListController.packageTagline}",
                            textSize: 12,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500),
                        const Spacer(),
                        const SizedBox(
                          height: 12,
                        ),
                        // Container(
                        //   child: const TextWidget(
                        //     text: "Edit",
                        //     textSize: 16,
                        //     color: AppColors.primaryColor,
                        //   ),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: AppColors.primaryColor),
                        //       borderRadius: BorderRadius.circular(4)),
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8, vertical: 4),
                        // ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: SelectHolidayType(isBlackTheme: true),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ProceedToBookWidget(),
                    SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.blackColor,
                      ),
                      child: TabBar(
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor: AppColors.whiteColor,
                        controller: _tabController,
                        indicatorColor: AppColors.primaryColor,
                        indicator: BoxDecoration(),
                        tabs: [
                          Tab(text: 'ITINERARY'),
                          Tab(text: 'POLICY'),
                          Tab(text: 'SUMMARY'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          50,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ItenararyWidget(),
                          Center(
                            child: Text('Policy Page'),
                          ),
                          Center(
                            child: Text('Summary Page'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
