import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appcolors/app_colors.dart';

class Helper {
  static String formatPrice(String text) {
    return "\u{20B9} $text";
  }

  static String formatDate(String date) {
    return DateFormat("dd-MM-yyy").format(DateTime.parse(date));
  }

  static String formatDatePost(String date) {
    return DateFormat("dd/MM/yyyy").format(DateTime.parse(date));
  }

  static imageLoader() {
    return Container(
        color: Colors.black12,
        child: const SpinKitThreeBounce(size: 18, color: Colors.black));
  }

  static launchPhone(String phoneNumber) async {
    // if (await canLaunch("tel:$phoneNumber")) {
    await launch("tel:$phoneNumber");
    // } else {
    //   throw 'Could not launch $phoneNumber';
    // }
  }

  static launchMail(String mail) async {
    // if (await canLaunch("mailto:$phoneNumber")) {
    await launch("mailto:$mail");
    // } else {
    //   throw 'Could not launch $phoneNumber';
    // }
  }

  static pageLoading() {
    return Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: const SpinKitThreeBounce(size: 30, color: Colors.black));
  }

  static loader(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SpinKitThreeBounce(size: 30, color: Colors.white);
      },
    );
  }

  static getDilogueLoader() {
    Get.defaultDialog(
        title: "",
        titlePadding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        content: SpinKitThreeBounce(size: 30, color: Colors.white));
  }
}
