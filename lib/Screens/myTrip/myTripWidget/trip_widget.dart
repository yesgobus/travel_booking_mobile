import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/dilogue/feedback_dilogue.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class TripDetailWidget extends StatefulWidget {
  int index;
  TripDetailWidget({super.key, required this.index});

  @override
  State<TripDetailWidget> createState() => _TripDetailWidgetState();
}

class _TripDetailWidgetState extends State<TripDetailWidget> {
  late int index;
  BookingController bookingController = Get.find();
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: const Color.fromRGBO(0, 0, 0, 0.22)),
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 3,
            color: Color.fromRGBO(0, 0, 0, 0.30),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(
                      bookingController.myTripList[index].image!,
                    ),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bookingController.myTripList[index].name!,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.blue)),
                  child: Text(
                    '${bookingController.myTripList[index].totalDuration}',
                    style:
                        theme.textTheme.bodySmall?.copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                TextWidget(text: "Booking ID: ${bookingController.myTripList[index].id}", textSize: 14),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: List.generate(
                  bookingController.myTripList[index].tripBenefit!.length,
                  (ind) => tripFacility(
                      bookingController.myTripList[index].tripBenefit![ind])),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.grey1Color,
              border: Border.all(color: AppColors.grey3Color),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${bookingController.myTripList[index].disText}',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₹${bookingController.myTripList[index].withoutFlitePrice}/',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: TextWidget(
                            text: 'Person',
                            textSize: 10,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 5),
                    // const Text(
                    //   'Total Price 48,200',
                    //   style: TextStyle(fontSize: 10),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          TextWidget(
              text: "${bookingController.myTripList[index].bookingStatus}",
              color: AppColors.redColor,
              textSize: 18,
              fontWeight: FontWeight.w500),
          const SizedBox(height: 6),
          TextWidget(
            text:
                "Your Trip Date ${bookingController.myTripList[index].statusTime}",
            textSize: 14,
            // fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 10),
          if(bookingController.myTripList[index].bookingStatus=="COMPLETED")
          InkWell(
            onTap: () {
              FeedbackDilogue.feedbackDilogue(
                  context, bookingController.myTripList[index].id);
            },
            child: Column(
              children: [
                Divider(height: 0),
                const SizedBox(height: 10),
                TextWidget(
                    text: "+ Add Your Valuable Feedback",
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    textSize: 14),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tripFacility(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(
              Icons.circle,
              size: 10,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
