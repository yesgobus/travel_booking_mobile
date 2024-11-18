import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class PackageDetailWidget extends StatefulWidget {
  int index;
  late bool isWishlisht;

  PackageDetailWidget(
      {super.key, required this.index, required this.isWishlisht});

  @override
  State<PackageDetailWidget> createState() => _PackageDetailWidgetState();
}

class _PackageDetailWidgetState extends State<PackageDetailWidget> {
  late int index;
  PackageListController packageListController = Get.find();
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              width: 80,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: const TextWidget(
                text: 'Best Offer',
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                textSize: 15,
                color: AppColors.primaryColor,
              )),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(0, 0, 0, 0.22)),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 31,
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                  )
                ],
              ),
              child: Column(
                children: [
                  Image.network(
                    packageListController.packageList[index].image!,
                    fit: BoxFit.cover,
                    width: Get.width,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            packageListController.packageList[index].name!,
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.blue)),
                          child: Text(
                            '${packageListController.packageList[index].totalDuration}',
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 0),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                          packageListController
                              .packageList[index].tripBenefit!.length,
                          (ind) => tripFacility(packageListController
                              .packageList[index].tripBenefit![ind])),
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
                            '${packageListController.packageList[index].disText}',
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹${packageListController.packageList[index].withoutFlitePrice}/',
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8, top: 8, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.percent,
                            size: 13,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        TextWidget(
                          text:
                              "${packageListController.packageList[index].couponCode}",
                          textSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () {
                  packageListController.packageList[index].isWishlisted =
                      !packageListController.packageList[index].isWishlisted!;

                  packageListController
                      .addUpdateWishlist(
                          context: context,
                          isWhishlisted: packageListController
                              .packageList[index].isWishlisted!,
                          packageId:
                              packageListController.packageList[index].id!)
                      .then((val) {
                    if (widget.isWishlisht) {
                      packageListController.getWishlistedPackage();
                    }
                  });
                  setState(() {});
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.blackColor,
                  radius: 15,
                  child: packageListController.packageList[index].isWishlisted!
                      ? Icon(
                          Icons.favorite,
                          color: AppColors.redColor,
                          size: 18,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: AppColors.whiteColor,
                          size: 18,
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
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
