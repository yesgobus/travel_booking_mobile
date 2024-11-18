import 'dart:convert';
import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:crypto/crypto.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/Screens/bottom_navigation/bottom_navigation.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/utils/helper/helper_sncksbar.dart';

class PhonepeScreen extends StatefulWidget {
  const PhonepeScreen({super.key});

  @override
  State<PhonepeScreen> createState() => _PhonepeScreenState();
}

class _PhonepeScreenState extends State<PhonepeScreen> {
  BookingController bookingController = Get.find();
  Object? Result;
  String environmentValue = 'SANDBOX';
  String appId = "";
  String callBackUrl =
      "https://webhook.site/18b97022-5593-4007-8853-a0db128b43dc";
  String merchantId = "PGTESTPAYUAT86";
  bool enableLog = true;
  String packageName = "com.yesgobus.travel";

  @override
  void initState() {
    PhonePePaymentSdk.init(environmentValue, "", merchantId, enableLog)
        .then((val) => {
              setState(() {
                log('PhonePe SDK Initialized - $val');
                startPgTransaction();
              })
            })
        .catchError((error) {
      log(error);
      return <dynamic>{};
    });
    super.initState();
  }

  startPgTransaction() async {
    final data = {
      "merchantId": merchantId,
      "merchantTransactionId": "${bookingController.orderId}",
      "amount": (bookingController.phonePayAmt) * 100,
      "callbackUrl":
          "https://apis.yesgobus.com/api/payment/checkPaymentStatus/${bookingController.orderId}",
      "paymentInstrument": {
        "type": "PAY_PAGE",
      }
    };
    String jsonString = jsonEncode(data);
    List<int> bytes = utf8.encode(jsonString);
    final saltkey = "96434309-7796-489d-8924-ab56988a6076";
    final apiEndPoint = "/pg/v1/pay";
    final saltIndex = "1";
    String base64Data = base64Encode(bytes);
    String sha256Value = generateSha256Hash(base64Data + apiEndPoint + saltkey);
    String body = base64Data;
    String checksum = "$sha256Value###$saltIndex";

    try {
      PhonePePaymentSdk.startTransaction(
              body, callBackUrl, checksum, packageName)
          .then((response) {
        if (response != null) {
          String status = response['status'].toString();
          String error = response['error'].toString();
          if (status == 'SUCCESS') {
            log("Transaction Completion Successful!");
            Get.offAll(AppBottomNavigation());
          } else {
            Get.back();
            HelperSnackBar.snackBar("Error", error);
            log("Transaction Completion >> Status >> $status and Error >> $error");
          }
        } else {
          Get.back();
          HelperSnackBar.snackBar("Error", "Something went wrong");
          log("Transaction Incomplete");
        }
      }).catchError((error) {
        log(error.toString());
      });
    } catch (error) {
      log(error.toString());
    }
  }

  String generateSha256Hash(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
