import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/customerSuppportController/cus_support_controller.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/form_field/input_decoration.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../utils/getStore/get_store.dart';

class SupportTab extends StatefulWidget {
  const SupportTab({super.key});

  @override
  State<SupportTab> createState() => _SupportTabState();
}

class _SupportTabState extends State<SupportTab> {
  CustomerSupportController customerSupportController =
      Get.put(CustomerSupportController());
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Customer Support',
          textSize: 18,
          fontWeight: FontWeight.w500,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 120),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'Hi ${GetStoreData.getStore.read('name') ?? ""}, We are here to help you at every step. Please browse through the options below and tap on what you’re looking for.',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  PngAssetPath.supportLogo,
                  height: 117,
                  width: 99,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey[100],
        child: Column(
          children: [
            // const SizedBox(height: 12),
            // needHelp(),
            const SizedBox(height: 12),
            addBooking(),
          
           
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton.primaryButton(
                title: 'Call our customer support',
                onButtonPressed: () {
                  customerSupportController.bookingQuery(context);
                },
              ),
      ),
    );
  }

  Widget needHelp() {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.15)),
        ],
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.12),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Need help with your trip ?',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'View and manage all your bookings.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.12)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  'You haven’t made any bookings with us.',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Once you book. You can view bookings from here or by going to MyTrips from home',
                  style: theme.textTheme.labelSmall,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget addBooking() {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.15)),
        ],
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.12),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Booking',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'View and manage a booking by entering the booking ID here. For verifying the details, an OTP will be sent to the customer who has made the booking.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          const TextWidget(
              text: "Booking ID", textSize: 14, fontWeight: FontWeight.w500),
          const SizedBox(height: 10),
          MyCustomTextField.textField(
              hintText: "Enter a Booking ID",
              borderClr: AppColors.grey3Color,
              controller: customerSupportController. bookingIDcontroller)
        ],
      ),
    );
  }
}
