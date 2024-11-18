import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:get/get.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/Screens/01BUSAPP/phonePay.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/appcolors/app_colors.dart';
import '../../../widget/buttons/button.dart';
import '../../../widget/textwidget/text_widget.dart';
import '../../bottom_navigation/bottom_navigation.dart';
import '../../payment/payment_webview.dart';

class GrandTotalWidget extends StatefulWidget {
  const GrandTotalWidget({super.key});

  @override
  State<GrandTotalWidget> createState() => _GrandTotalWidgetState();
}

class _GrandTotalWidgetState extends State<GrandTotalWidget> {
  BookingController bookingController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                                text:
                                    "GRAND TOTAL - ${bookingController.bookingData.value!.totalGuests} Adults",
                                textSize: 12),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                TextWidget(
                                    text:
                                        "₹ ${bookingController.bookingData.value!.totalPackagePrice}",
                                    textSize: 18,
                                    fontWeight: FontWeight.w500),
                                TextWidget(
                                  text: " (Include GST)",
                                  color: AppColors.black65,
                                  textSize: 15,
                                )
                              ],
                            ),
                            const SizedBox(height: 6),
                            const TextWidget(
                                text: "Pay Full Amount Now", textSize: 14)
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
              const TextWidget(text: "Fare Breakup", textSize: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const TextWidget(text: "Total Basic Cost ", textSize: 14),
                    const Spacer(),
                    TextWidget(
                      text:
                          "₹${bookingController.bookingData.value!.totalBasicCost}",
                      textSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const TextWidget(text: "Coupon Discount", textSize: 14),
                    const Spacer(),
                    TextWidget(
                      text:
                          "- ₹${bookingController.bookingData.value!.couponDiscount}",
                      textSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const TextWidget(text: "Fees & Taxes", textSize: 14),
                    const Spacer(),
                    TextWidget(
                      text:
                          "+ ₹${bookingController.bookingData.value!.feesTexes}",
                      textSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Divider(color: AppColors.black65),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 8, vertical: 10),
                child: AppButton.primaryButton(
                    onButtonPressed: () {
                      if (bookingController.formkey.currentState!.validate()) {
                        bookingController
                            .bookingStoreApi(context)
                            .then((value) async {
                          if (value) {
                            Get.to(PhonepeScreen());
                          } // Get.to(() => PaymentWebScreen(
                          //       bookingID: bookingController
                          //           .bookingData.value!.bookingId!,
                          //       amt: bookingController
                          //           .bookingData.value!.totalPackagePrice!,
                          //     ));
                        });
                      }
                    },
                    title: "Proceed To Book Online"),
              ),
            ],
          ),
        ));
  }

  late CFEnvironment environment;
  var cfPaymentGatewayService = CFPaymentGatewayService();

  CFSession? createSession() {
    environment = CFEnvironment.SANDBOX;
    log(environment.toString());
    try {
      var session = CFSessionBuilder()
          .setEnvironment(environment)
          .setOrderId(bookingController.orderId)
          .setPaymentSessionId(bookingController.paymentSessionId)
          .build();
      return session;
    } on CFException catch (e) {
      print(e.message);
    }
    return null;
  }

  pay() async {
    try {
      var session = createSession();
      List<CFPaymentModes> components = <CFPaymentModes>[];
      var paymentComponent =
          CFPaymentComponentBuilder().setComponents(components).build();

      var theme = CFThemeBuilder()
          .setNavigationBarBackgroundColorColor("#FD5901")
          .setPrimaryFont("Menlo")
          .setSecondaryFont("Futura")
          .build();

      var cfDropCheckoutPayment = CFDropCheckoutPaymentBuilder()
          .setSession(session!)
          .setPaymentComponent(paymentComponent)
          .setTheme(theme)
          .build();

      cfPaymentGatewayService.doPayment(cfDropCheckoutPayment);
    } on CFException catch (e) {
      print(e.message);
    }
  }

  void verifyPayment(String orderId) {
    log("Verify Payment");
    Get.offAll(AppBottomNavigation());
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    log(errorResponse.getMessage().toString());
    print("Error while making payment");
  }
}
