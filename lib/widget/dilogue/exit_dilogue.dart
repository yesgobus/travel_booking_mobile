import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screens/authentication/login_page.dart';
import '../../utils/appcolors/app_colors.dart';
import '../../utils/getStore/get_store.dart';
import '../../utils/helper/helper.dart';
import '../../utils/helper/helper_sncksbar.dart';
import '../textWidget/text_widget.dart';

Future<bool> showExitPopup(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.redColor,
                      border:
                          Border.all(color: AppColors.whiteColor, width: 0)),
                  child: Icon(
                    Icons.logout,
                    size: 40,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextWidget(
                  text: "Exit",
                  textSize: 20,
                  color: AppColors.blackColor,
                  maxLine: 2,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextWidget(
                  text: "  Are You Sure Want To Exit From YesGo Bus?  ",
                  textSize: 14,
                  color: AppColors.black65,
                  maxLine: 2,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: AppColors.grey3Color,
                  height: 0,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back(result: false);
                        },
                        child: SizedBox(
                          height: 45,
                          child: Center(
                            child: TextWidget(
                              text: "no".toUpperCase(),
                              color: Colors.black54,
                              textSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 1,
                      color: AppColors.grey3Color,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back(result: true);
                        },
                        child: SizedBox(
                            height: 45,
                            child: Center(
                              child: TextWidget(
                                  text: "yes".toUpperCase(),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  textSize: 14),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
}
