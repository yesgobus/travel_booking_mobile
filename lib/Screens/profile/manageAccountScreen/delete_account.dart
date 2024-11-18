import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/customerSuppportController/cus_support_controller.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1Color,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        titleSpacing: 0,
        title: TextWidget(
          text: "Delete My Account",
          textSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text:
                            "Are you sure you wish to delete your Yesgobus account ?",
                        maxLine: 2,
                        textSize: 15),
                    Divider(),
                    TextWidget(
                        text:
                            "You will NOT be able to view your travel booking history",
                        color: AppColors.black65,
                        textSize: 13),
                    Divider(),
                    TextWidget(
                        text:
                            "You will NOT be able to grab WOW offers & super-benefits",
                        color: AppColors.black65,
                        textSize: 13),
                    Divider(),
                    TextWidget(
                        text:
                            "Please note that account deletion will take up to 20 days.",
                        color: AppColors.black65,
                        textSize: 13),
                  ],
                ),
              ),
              elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text:
                    "Please let us know the reason for deleting your account:",
                maxLine: 2,
                textSize: 15,
              ),
            ),
            ListView.builder(
              itemCount: reasonList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Radio(
                        visualDensity: VisualDensity.compact,
                        value: reasonList[index],
                        activeColor: AppColors.primaryColor,
                        groupValue: selectedReason,
                        onChanged: (val) {
                          selectedReason = val;
                          setState(() {});
                        }),
                    Expanded(
                        child: TextWidget(
                            text: reasonList[index], maxLine: 2, textSize: 14))
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton.primaryButton(
                  onButtonPressed: selectedReason == null
                      ? null
                      : () {
                          customerSupportController.deleteAccount(
                              context: context, reason: selectedReason!);
                        },
                  bgColor: selectedReason == null
                      ? AppColors.grey3Color
                      : AppColors.primaryColor,
                  title: "Continue and Delete"),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                  text: "I will keep My Account",
                  textSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  CustomerSupportController customerSupportController =
      Get.put(CustomerSupportController());
  String? selectedReason;

  List<String> reasonList = [
    "I don’t want to use YesGoBus anymore",
    "I have a privacy concern",
    "I get too many notifications/emails from YesGoBus",
    "I have another account",
    "The app is not working properly",
  ];
}
