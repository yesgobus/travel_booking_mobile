import 'package:flutter/material.dart';
import 'package:travel_booking/Screens/detailProceedPayment/detailProceedWidget/promocode.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Select a Payment option",
          textSize: 16,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.grey2Color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  TextWidget(
                    text: "Amazing Goa Flight Inclusive Deal 3N",
                    textSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 12),
                  TextWidget(
                      text: "Experience beaches and sunset", textSize: 14),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: TextWidget(
                      text: "3N/4D",
                      textSize: 12,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.primaryColor.withOpacity(0.3)),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      TextWidget(text: "Pay ₹15,470", textSize: 14),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: PromoCodeWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextWidget(
                  text: "ALL PAYMENT OPTION",
                  textSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            Container(
              color: AppColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.wallet, size: 25),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "Yesgobus wallet", textSize: 14),
                            SizedBox(height: 6),
                            TextWidget(
                                text:
                                    "Pay with yesgobus wallet and  get more offers",
                                textSize: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/png/phonepe.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "PhonePe QR", textSize: 14),
                            SizedBox(height: 6),
                            TextWidget(
                                text: "To use phonepe qr for payment",
                                textSize: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/png/upi.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "UPI", textSize: 14),
                            SizedBox(height: 6),
                            TextWidget(
                                text:
                                    "Link bank accounts ,GPay, Phonepe and more",
                                textSize: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance, size: 25),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "NetBanking", textSize: 14),
                            SizedBox(height: 6),
                            TextWidget(
                                text: "All Major banks available",
                                textSize: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextWidget(
                  text: "NET BANKING",
                  textSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            Container(
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Image.asset(
                    'assets/images/png/axis.png',
                    height: 30,
                  ),
                  SizedBox(width: 24),
                  Image.asset(
                    'assets/images/png/sbi.png',
                    height: 30,
                  ),
                  SizedBox(width: 24),
                  Image.asset(
                    'assets/images/png/hdfc.png',
                    height: 30,
                  )
                ],
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
