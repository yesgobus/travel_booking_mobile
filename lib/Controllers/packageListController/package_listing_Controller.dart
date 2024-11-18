import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/itenoryModel/itenory_model.dart';
import '../../Model/packageListModel/package_list_model.dart';
import '../../Screens/packageList/packageListwidget/select_travel_modal.dart';
import '../../Service/apiService/api_base.dart';
import '../../Service/apiService/api_url.dart';
import '../../config/routes/app_routes.dart';
import '../../utils/helper/helper.dart';
import '../../utils/helper/helper_sncksbar.dart';

class PackageListController extends GetxController {
  var isLoading = false.obs;
  List<Package> packageList = [];
  String packageTagline = "";
  Package selectedPackage = Package();
  bool withFlight = false;

  void selectTravelModal(
      {required BuildContext context,
      required int index,
      required Function() onTap}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: SelectTravelModal(onTap: onTap, index: index),
        );
      },
    );
  }
  Future getPackage({required String destination}) async {
    try {
      packageList.clear();
      isLoading(true);
      var response = await ApiBase.postRequest(
          extendedURL: ApiUrl.packageUrl,
          body: {'destination': destination},
          withToken: true);
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        PackageListModel packageListModel = PackageListModel.fromJson(data);
        packageTagline = packageListModel.data!.tagline!;
        packageList.addAll(packageListModel.data!.packages!);
      }
    } catch (e) {
      log("getPackage $e");
    } finally {
      isLoading(false);
    }
  }

  Future getWishlistedPackage() async {
    try {
      packageList.clear();
      isLoading(true);
      var response = await ApiBase.getRequest(
        extendedURL: ApiUrl.getWishlistUrl,
      );
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        PackageListModel packageListModel = PackageListModel.fromJson(data);
        packageList.addAll(packageListModel.data!.packages!);
      }
    } catch (e) {
      log("getwishlist $e");
    } finally {
      isLoading(false);
    }
  }

  HotelData hotelData = HotelData();
  Future getItenary({
    required context,
    required String destination,
    required String startDate,
    required String endDate,
    required String hotelId,
    required String packageId,
  }) async {
    Helper.loader(context);
    var body = {
      "destination": destination,
      // "start_date": startDate,
      // "end_date": endDate,
      "hotelId": hotelId,
      "packageId":packageId
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.itenaryPlansUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
      Get.back();
      Get.back();
      ItenoryModel itenoryModel = ItenoryModel.fromJson(data);
      hotelData = itenoryModel.data!.hotelData!;
      Get.toNamed(AppRoutes.packageDesc);
    } else {
      Get.back();
      HelperSnackBar.snackBar("Error", data["message"]);
      return "";
    }
  }

  Future addUpdateWishlist({
    required context,
    required String packageId,
    required bool isWhishlisted,
  }) async {
    var body = {
      "packageId": packageId,
      "isWishlisted": isWhishlisted,
    };
    var response = await ApiBase.postRequest(
        body: body, extendedURL: ApiUrl.addToWishlistUrl, withToken: true);
    log(response.body);
    var data = json.decode(response.body);
    if (data["status"] == true) {
    } else {
      Get.back();
      HelperSnackBar.snackBar("Error", data["message"]);
      return "";
    }
  }
}
