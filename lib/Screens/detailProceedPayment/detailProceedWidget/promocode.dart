import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/form_field/input_decoration.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class PromoCodeWidget extends StatefulWidget {
  const PromoCodeWidget({super.key});

  @override
  State<PromoCodeWidget> createState() => _PromoCodeWidgetState();
}

class _PromoCodeWidgetState extends State<PromoCodeWidget> {
  BookingController bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.black45),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextWidget(
              text: "OFFERS",
              textSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.grey3Color),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: TextWidget(
                      text: "ENTER PROMO CODE",
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: MyCustomTextField.textField(
                              hintText: "Got a promocode ? Enter",
                              borderClr: AppColors.grey4Color,
                              controller: bookingController.promoController),
                        ),
                        SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            bookingController
                                .applyCoupnApi(context)
                                .then((value) {
                             
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 18,
                            child: Icon(
                              Icons.send,
                              color: AppColors.whiteColor,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
