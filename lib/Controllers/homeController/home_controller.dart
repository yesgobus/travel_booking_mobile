import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/customerReviewModel/cus_review_model.dart';
import '../../Model/popularDestinationModel/popular_destination_model.dart';
import '../../Model/todaysOffersModel/todays_offer_model.dart';
import '../../Service/apiService/api_base.dart';
import '../../Service/apiService/api_url.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isLoading3 = false.obs;
  List<Destination> destinationList = [];

  TextEditingController adultController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  final TextEditingController startDestController = TextEditingController();
  final TextEditingController endDestController = TextEditingController();
  String departureDate = "";
  String returnDate = "";
  String departureDatePost = "";
  String returnDatePost = "";
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now().add(Duration(days: 3));
  Future getPopularDestination() async {
    try {
      destinationList.clear();
      isLoading2(true);
      var response =
          await ApiBase.getRequest(extendedURL: ApiUrl.getDestinationUrl);
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        PopularDestinationModel popularDestinationModel =
            PopularDestinationModel.fromJson(data);
        destinationList.addAll(popularDestinationModel.data!.destination!);
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${destinationList.length}");
      }
      update();
    } catch (e) {
      log("getDashboard $e");
    } finally {
      isLoading2(false);
    }
  }

  List<FeedbackData> feedbackData = [];

  Future getCustomerReview() async {
    try {
      feedbackData.clear();
      isLoading3(true);
      var response =
          await ApiBase.getRequest(extendedURL: ApiUrl.customerReviewUrl);
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        CustomerReviewModel customerReviewModel =
            CustomerReviewModel.fromJson(data);
        feedbackData.addAll(customerReviewModel.data!.feedback!);
      }
      update();
    } catch (e) {
      log("getDashboard $e");
    } finally {
      isLoading3(false);
    }
  }
  

  List<Offer> offersdata = [];

  Future getTodaysOffers() async {
    try {
      offersdata.clear();
      isLoading(true);
      var response =
          await ApiBase.getRequest(extendedURL: ApiUrl.todaysOffersUrl);
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        TodaysOffersModel todaysOffersModel = TodaysOffersModel.fromJson(data);
        offersdata.addAll(todaysOffersModel.data!.offers!);
      }
      update();
    } catch (e) {
      log("getDashboard $e");
    } finally {
      isLoading(false);
    }
  }
}
