import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Screens/authentication/login_page.dart';
import 'package:travel_booking/Screens/authentication/signup_page.dart';

import '../../Service/apiService/api_base.dart';
import '../../Service/apiService/api_url.dart';
import '../../utils/getStore/get_store.dart';
import '../../utils/helper/helper.dart';
import '../../utils/helper/helper_sncksbar.dart';

class CustomerSupportController extends GetxController {
  TextEditingController bookingIDcontroller = TextEditingController();

  Future bookingQuery(context) async {
    Helper.loader(context);
    var body = {
      "bookingId": "${bookingIDcontroller.text}",
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.addBookingQueryUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
      Get.back();
      bookingIDcontroller.clear();
      HelperSnackBar.snackBar("Success", data["message"]);
    } else {
      Get.back();
      bookingIDcontroller.clear();

      HelperSnackBar.snackBar("Error", data["message"]);
      return "";
    }
  }

  Future deleteAccount({required context, required String reason}) async {
    Helper.loader(context);
    var body = {
      "reason": reason,
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.deleteAccountUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) { 
      Get.back();
      HelperSnackBar.snackBar("Success", data["message"]);
      GetStoreData.getStore.erase();

      Get.offAll(() => SignupScreen());
    } else {
      Get.back();

      HelperSnackBar.snackBar("Error", data["message"]);
      return "";
    }
  }
}
