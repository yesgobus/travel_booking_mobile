import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/loginController/login_controller.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/utils/helper/helper_sncksbar.dart';

import '../../config/routes/app_routes.dart';
import '../../utils/appcolors/app_colors.dart';
import '../../utils/constant/png_asset_constant.dart';
import '../../widget/buttons/button.dart';
import '../../widget/form_field/input_decoration.dart';
import '../../widget/textwidget/text_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  LoginMobileController loginMobileController =
      Get.put(LoginMobileController());
  @override
  void initState() {
    loginMobileController.isLogin = false;
    super.initState();
  }

  @override
  void dispose() {
    loginMobileController.isLogin = true;

    super.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PngAssetPath.loginbg), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // const Spacer(),
                  Center(
                    child: Image.asset(
                      PngAssetPath.appLogo,
                      color: AppColors.whiteColor,
                      height: 120,
                      width: 120,
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'YesGoBus',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                      child: TextWidget(
                    text: 'Signup with your mobile number',
                    color: AppColors.whiteColor,
                    textSize: 12,
                  )),
                  const SizedBox(height: 20),
                  // InkWell(
                  //   onTap: () {
                  //     loginMobileController.openCameraGallery(isCamera: false);
                  //     Get.back();
                  //   },
                  //   child: Stack(
                  //     alignment: Alignment.bottomRight,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: CircleAvatar(
                  //           radius: 40,
                  //           backgroundColor: AppColors.whiteColor,
                  //           child: GetBuilder<LoginMobileController>(
                  //             builder: (c) {
                  //               if (c.image != null) {
                  //                 return ClipRRect(
                  //                   borderRadius: BorderRadius.circular(100),
                  //                   child: Image.file(
                  //                     File(
                  //                       c.image!.path,
                  //                     ),
                  //                     height: 80,
                  //                     width: 80,
                  //                     fit: BoxFit.fill,
                  //                   ),
                  //                 );
                  //               } else {
                  //                 return Padding(
                  //                   padding: EdgeInsets.all(6.0),
                  //                   child: Icon(
                  //                     Icons.person,
                  //                     size: 40,
                  //                     color: AppColors.grey5Color,
                  //                   ),
                  //                 );
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //       Card(
                  //         elevation: 5,
                  //         color: AppColors.primaryColor,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50.0),
                  //         ),
                  //         margin: const EdgeInsets.all(0),
                  //         child: Padding(
                  //           padding: EdgeInsets.all(3.0),
                  //           child: Icon(
                  //             Icons.camera_alt,
                  //             size: 20,
                  //             color: AppColors.whiteColor,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  TextWidget(
                      text: "Mobile Number",
                      color: AppColors.whiteColor,
                      textSize: 16),
                  const SizedBox(height: 4),
                  MyCustomTextField.textFieldPhone(
                      textInputType: TextInputType.phone,
                      borderRadius: 15,
                      controller: loginMobileController.phoneController,
                      borderClr: AppColors.whiteColor,
                      textClr: AppColors.whiteColor,
                      valText: "Please enter mobile number",
                      hintText: "Enter Mobile Number"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: "First Name",
                                color: AppColors.whiteColor,
                                textSize: 16),
                            const SizedBox(height: 4),
                            MyCustomTextField.textField(
                                controller:
                                    loginMobileController.firstNameController,
                                borderClr: AppColors.whiteColor,
                                textClr: AppColors.whiteColor,
                                valText: "Please enter first name",
                                hintText: "Enter First Name"),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: "Last Name",
                                color: AppColors.whiteColor,
                                textSize: 16),
                            const SizedBox(height: 4),
                            MyCustomTextField.textField(
                                controller:
                                    loginMobileController.lastNameController,
                                borderClr: AppColors.whiteColor,
                                textClr: AppColors.whiteColor,
                                valText: "Please enter last name",
                                hintText: "Enter Last Name"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextWidget(
                      text: "Email",
                      color: AppColors.whiteColor,
                      align: TextAlign.start,
                      textSize: 16),
                  const SizedBox(height: 4),
                  MyCustomTextField.textField(
                      controller: loginMobileController.emailController,
                      borderClr: AppColors.whiteColor,
                      textClr: AppColors.whiteColor,
                      hintText: "Enter Email"),
                  const SizedBox(height: 8),
                  TextWidget(
                      text: "Password",
                      color: AppColors.whiteColor,
                      align: TextAlign.start,
                      textSize: 16),
                  const SizedBox(height: 4),
                  MyCustomTextField.textField(
                      controller: loginMobileController.passwordController,
                      borderClr: AppColors.whiteColor,
                      textClr: AppColors.whiteColor,
                      valText: "Please enter password",
                      hintText: "Enter Password"),
                  const SizedBox(height: 8),
                  TextWidget(
                      text: "Confirm Password",
                      color: AppColors.whiteColor,
                      align: TextAlign.start,
                      textSize: 16),
                  const SizedBox(height: 4),
                  MyCustomTextField.textField(
                      controller: loginMobileController.conPasswordController,
                      borderClr: AppColors.whiteColor,
                      textClr: AppColors.whiteColor,
                      valText: "Please enter confirm password",
                      hintText: "Enter Confirm Password"),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: AppButton.primaryButton(
            title: 'SIGN UP',
            onButtonPressed: () {
              if (formkey.currentState!.validate()) {
                if (loginMobileController.passwordController.text ==
                    loginMobileController.conPasswordController.text) {
                  Get.toNamed(AppRoutes.otp);
                } else {
                  HelperSnackBar.snackBar("Error", "Password not matched");
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

// Future<bool> chooseImage({
//   required BuildContext context,
//   required Function() onTapCamera,
//   required Function() onTapGallery,
// }) async {
//   final width = MediaQuery.of(context).size.width;
//   return await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             contentPadding: const EdgeInsets.all(0),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: AppColors.primaryColor,
//                       border: Border.all(color: AppColors.white, width: 0)),
//                   child: const Icon(
//                     Icons.image,
//                     size: 40,
//                     color: AppColors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 const TextWidget(
//                   text: AppText.uploadProfile,
//                   textSize: 18,
//                   color: AppColors.black,
//                   maxLine: 2,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ListTile(
//                         leading: Icon(
//                           Icons.camera_alt,
//                           color: AppColors.black65,
//                           size: 30,
//                         ),
//                         title: const TextWidget(
//                           text: "Take Photo",
//                           textSize: 16,
//                           color: Colors.black,
//                         ),
//                         onTap: onTapCamera,
//                       ),
//                       ListTile(
//                         leading: Icon(
//                           Icons.image,
//                           color: AppColors.black65,
//                           size: 30,
//                         ),
//                         title: const TextWidget(
//                             text: "Choose From Gallery",
//                             textSize: 16,
//                             color: Colors.black),
//                         onTap: onTapGallery,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   color: AppColors.grey3Color,
//                   height: 0,
//                   thickness: 1,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: SizedBox(
//                           height: 45,
//                           child: Center(
//                             child: TextWidget(
//                               text: "cancel".toUpperCase(),
//                               color: Colors.black54,
//                               fontWeight: FontWeight.w500,
//                               textSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ));
// }
