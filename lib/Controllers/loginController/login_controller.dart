import 'dart:convert';
import 'dart:developer' as log;
// import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_booking/Service/apiService/api_url.dart';
// import 'package:image_picker/image_picker.dart';
import '../../Service/apiService/api_base.dart';
import '../../config/routes/app_routes.dart';
import '../../utils/getStore/get_store.dart';
import '../../utils/helper/helper.dart';
import '../../utils/helper/helper_sncksbar.dart';

class LoginMobileController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLogin = true;
  // Future<String> loginApi(context) async {
  //   Helper.loader(context);
  //   var body = {
  //     "mobileNumber": "91${phoneController.text}",
  //     "password": passwordController.text
  //   };
  //   var response = await ApiBase.postRequest(
  //       body: body, extendedURL: ApiUrl.loginUrl, withToken: false);
  //   log.log(response.body);
  //   var data = json.decode(response.body);
  //   if (data["status"] == true) {
  //     Get.back();
  //     GetStoreData.storeUserData(
  //         id: data['data']['user']['_id'],
  //         email: data['data']['user']['email'],
  //         name: data['data']['user']['firstName'] +
  //             " " +
  //             data['data']['user']['lastName'],
  //         authToken: data['data']['token']);
  //     Get.toNamed(AppRoutes.bottomNav);
  //     return data['data']['otp'].toString();
  //   } else {
  //     Get.back();
  //     HelperSnackBar.snackBar("Error", data["message"]);
  //     return "";
  //   }
  // }

  // Future<String> signupApi(context) async {
  //   Helper.loader(context);
  //   var body = {
  //     "mobileNumber": "91${phoneController.text}",
  //     "firstName": firstNameController.text,
  //     "lastName": lastNameController.text,
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   };
  //   var response = await ApiBase.postRequest(
  //       body: body, extendedURL: ApiUrl.signupUrl, withToken: false);
  //   log.log(response.body);
  //   var data = json.decode(response.body);
  //   if (data["status"] == true) {
  //     Get.back();
  //     GetStoreData.storeUserData(
  //         id: data['data']['user']['_id'],
  //         email: data['data']['user']['email'],
  //         name: data['data']['user']['firstName'] +
  //             " " +
  //             data['data']['user']['lastName'],
  //         authToken: data['data']['token']);

  //     log.log(GetStoreData.getStore.read('access_token'));
  //     Get.offAllNamed(AppRoutes.bottomNav);

  //     return data['data']['otp'].toString();
  //   } else {
  //     Get.back();
  //     HelperSnackBar.snackBar("Error", data["message"]);
  //     return "";
  //   }
  // }

  //otp sent
  String _verificationCode = '';

  Future<void> sendOTP() async {

      const String accountSid = '';
      const String authToken = '';
      const String twilioNumber = '';
    // Generate a random 6-digit OTP code
    final Random random = Random();
    _verificationCode = '';
    for (var i = 0; i < 4; i++) {
      _verificationCode += random.nextInt(10).toString();
    }
    log.log(_verificationCode.toString());
    final http.Client client = http.Client();

    final http.Response response = await client.post(
      Uri.parse(
          'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json'),
      headers: <String, String>{
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'To': "+91${phoneController.text}",
        'From': twilioNumber,
        'Body': 'Your OTP is: $_verificationCode',
      },
    );
    log.log(response.body);
    if (response.statusCode == 201) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('OTP sent successfully!')));
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Failed to send OTP')));
    }

    client.close();
  }

  void verifyOTP(context) {
    if (otpcontroller.text == _verificationCode) {
      if (isLogin == false) {
        // signupApi(context);
      } else {
        Get.offAllNamed(AppRoutes.bottomNav);
      }
    } else {
      HelperSnackBar.snackBar("Error", "Incorrect OTP");
    }
  }

  // var imageBase64 = "".obs;
  // final ImagePicker _picker = ImagePicker();
  // XFile? image;

  // Future<void> openCameraGallery({required bool isCamera}) async {

  //   var tempimage = await _picker.pickImage(
  //       source: isCamera ? ImageSource.camera : ImageSource.gallery);
  //   if (tempimage != null) {
  //     // File f = new File(tempimage.path);
  //     // var s = f.lengthSync();
  //     // var fileSizeInKB = s / 2048;
  //     // if (fileSizeInKB > fileSizeLimit) {
  //     //   HelperSnackBar.snackBar("Error", "Please select under 2 mb");
  //     // } else {
  //     image = tempimage;
  //     File file = File(image!.path);
  //     List<int> fileInByte = file.readAsBytesSync();
  //     String fileInBase64 = base64Encode(fileInByte);
  //     imageBase64.value = "data:image/jpeg;base64,$fileInBase64";
  //     // }
  //   }
  //   // Get.back();
  //   update();
  // }
}
