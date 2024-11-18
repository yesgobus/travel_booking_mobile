import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Model/preBookingModel/prebooking_model.dart';

import '../../Model/myTripModel/myTripModel.dart';
import '../../Screens/detailProceedPayment/pkg_detail_proceed.dart';
import '../../Service/apiService/api_base.dart';
import '../../Service/apiService/api_url.dart';
import '../../config/routes/app_routes.dart';
import '../../utils/helper/helper.dart';
import '../../utils/helper/helper_sncksbar.dart';

class BookingController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  PackageListController packageListController =
      Get.put(PackageListController());
  var bookingData = Rxn<BookingData>();
  GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController promoController = TextEditingController();

  Future applyCoupnApi(context) async {
    Helper.loader(context);
    var body = {
      "bookingId": bookingData.value!.id,
      "coupon": promoController.text,
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.promocodeApiUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
      PreBookingModel preBookingModel = PreBookingModel.fromJson(data);
      bookingData.value = preBookingModel.data!.bookingData!;
      Get.back();
    } else {
      Get.back();
      HelperSnackBar.snackBar("Error", data["message"]);
      return "";
    }
  }

  Future prebookingApi(context) async {
    Helper.loader(context);
    var body = {
      "fromPlace": homeController.startDestController.text,
      "toPlace": homeController.endDestController.text,
      "departureDate": homeController.departureDatePost,
      "packageId": packageListController.selectedPackage.id,
      "returnDate": homeController.returnDatePost,
      "witheFlight": packageListController.withFlight,
      "totalGuests": homeController.adultController.text,
      "totalRoom": homeController.roomController.text,
      "guestsType": "students",
      "totalPackagePrice": packageListController.withFlight
          ? packageListController.selectedPackage.witheFlitePrice
          : packageListController.selectedPackage.withoutFlitePrice
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.preBookingApiUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
      Get.back();
      PreBookingModel preBookingModel = PreBookingModel.fromJson(data);
      bookingData.value = preBookingModel.data!.bookingData!;
      Get.toNamed(AppRoutes.packageDetailProceed);
    } else {
      Get.back();
      HelperSnackBar.snackBar("Error", data["message"]);
      return "";
    }
  }

  List<PersonDetail> personDetail = [];
  TextEditingController email = TextEditingController();
  TextEditingController mobilenum = TextEditingController();
  TextEditingController alternatemobilenum = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController specialReq = TextEditingController();
  String orderId = "";
  int phonePayAmt = 0;
  String paymentSessionId = "";
  Future<bool> bookingStoreApi(context) async {
    List<Map<String, dynamic>> personDetailJson =
        personDetail.map((person) => person.toJson()).toList();
    String requestBody = jsonEncode(personDetailJson);
    Helper.loader(context);
    var body = {
      "bookingId": bookingData.value!.id,
      "totalPackagePrice": bookingData.value!.totalPackagePrice,
      "email": email.text,
      "mobileNumber": mobilenum.text,
      "alternativeNumber": alternatemobilenum.text,
      "pincode": pincode.text,
      "state": state.text,
      "address": address.text,
      "spancelRequest": specialReq.text,
      "guestDetails": requestBody
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.bookingUpdateApiUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
      Get.back();

      orderId = data['data']['bookingData']['orderId'];
      phonePayAmt = data['data']['bookingData']['totalPackagePrice'];
      // HelperSnackBar.snackBar("Success", "Booking Created Successfullhy");
      // Get.offAllNamed(AppRoutes.bottomNav);
      return true;
    } else {
      Get.back();
      HelperSnackBar.snackBar("Error", data["message"]);
      return false;
    }
  }

  var isLoading = false.obs;
  List<BookingDatum> myTripList = [];

  Future getMyTrip() async {
    try {
      isLoading(true);
      myTripList.clear();
      var response = await ApiBase.getRequest(extendedURL: ApiUrl.myTripUrl);
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        MyTripModel myTripModel = MyTripModel.fromJson(data);
        myTripList.addAll(myTripModel.data!.bookingData!);
      }
      update();
    } catch (e) {
      log("getmytrip $e");
    } finally {
      isLoading(false);
    }
  }

  Future addReview(context, rate, review, id) async {
    Helper.loader(context);
    var body = {"rating": rate, "feedback": review, 'bookingId': id};
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.addReviewUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
      Get.back();
      Get.back();
      HelperSnackBar.snackBar("Success", data["message"]);
    } else {
      Get.back();
      HelperSnackBar.snackBar("Error", data["message"]);
    }
  }
}
