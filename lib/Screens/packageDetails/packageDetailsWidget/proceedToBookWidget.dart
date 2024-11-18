import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Screens/detailProceedPayment/pkg_detail_proceed.dart';
import 'package:travel_booking/config/routes/app_routes.dart';

import '../../../utils/appcolors/app_colors.dart';
import '../../../widget/buttons/button.dart';
import '../../../widget/textwidget/text_widget.dart';

class ProceedToBookWidget extends StatefulWidget {
  const ProceedToBookWidget({super.key});

  @override
  State<ProceedToBookWidget> createState() => _ProceedToBookWidgetState();
}

class _ProceedToBookWidgetState extends State<ProceedToBookWidget> {
  PackageListController packageListController = Get.find();
  HomeController homeController = Get.find();
  BookingController bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.black45),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: AppColors.primaryColor.withOpacity(0.3),
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextWidget(
                                text: packageListController.withFlight
                                    ? "₹ ${packageListController.selectedPackage.witheFlitePrice}"
                                    : "₹ ${packageListController.selectedPackage.withoutFlitePrice}",
                                textSize: 18,
                                fontWeight: FontWeight.w500),
                            const TextWidget(
                              text: "/Person",
                              textSize: 16,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TextWidget(
                            text: "*Excluding Applicable Taxes", textSize: 10)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade400,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: TextWidget(
                                text: "20% Off",
                                color: AppColors.whiteColor,
                                textSize: 16),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const TextWidget(
                            text: "Compare To Other's", textSize: 10)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                ),
                const SizedBox(width: 6),
                TextWidget(
                    text:
                        "${homeController.departureDate} - ${homeController.returnDate}",
                    textSize: 14),
                const Spacer(),
                // TextWidget(
                //   text: "Modify",
                //   textSize: 15,
                //   color: AppColors.primaryColor,
                //   fontWeight: FontWeight.w500,
                // ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Divider(color: AppColors.black65),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 8, vertical: 10),
            child: AppButton.primaryButton(
                onButtonPressed: () {
                  bookingController.prebookingApi(context);
                },
                title: "Proceed To Book Online"),
          ),
          // Divider(color: AppColors.black65),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       TextWidget(text: "View Your Customizations", textSize: 16),
          //       Icon(Icons.keyboard_arrow_up_outlined)
          //     ],
          //   ),
          // ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
