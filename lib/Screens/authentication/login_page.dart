import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Controllers/loginController/login_controller.dart';
import 'package:travel_booking/config/routes/app_routes.dart';
import 'package:travel_booking/config/routes/routes.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/buttons/outlined_icon_button.dart';
import 'package:travel_booking/widget/form_field/custom_text_form_field.dart';
import 'package:travel_booking/widget/form_field/input_decoration.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginMobileController loginMobileController =
      Get.put(LoginMobileController());
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PngAssetPath.loginbg), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                height: Get.height, width: Get.width, color: AppColors.black45),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      // const Spacer(),
                      Image.asset(
                        PngAssetPath.appLogo,
                        height: 120,
                        color: AppColors.whiteColor,
                        width: 120,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Welcome ',
                          style: const TextStyle(
                              fontSize: 24,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'YesGoBus',
                                style: TextStyle(color: AppColors.whiteColor)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      TextWidget(
                        text: 'Sign in with your mobile number',
                        color: AppColors.whiteColor,
                        textSize: 12,
                      ),
                      const SizedBox(height: 20),
                      MyCustomTextField.textFieldPhone(
                          textInputType: TextInputType.phone,
                          controller: loginMobileController.phoneController,
                          borderClr: AppColors.whiteColor,
                          textClr: AppColors.whiteColor,
                          valText: "Please enter mobile number",
                          hintText: "Mobile Number"),
                      const SizedBox(height: 10),

                      MyCustomTextField.textField(
                          textInputType: TextInputType.visiblePassword,
                          controller: loginMobileController.passwordController,
                          borderClr: AppColors.whiteColor,borderRadius: 100,
                          textClr: AppColors.whiteColor,
                          valText: "Please enter password",
                          hintText: "   Password"),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: 1, color: AppColors.whiteColor)),
                          const SizedBox(width: 6),
                          TextWidget(
                            text: "Or",
                            textSize: 14,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Container(
                                  height: 1, color: AppColors.whiteColor)),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      // CustomOutlinedIconButton(
                      //   radius: 50,
                      //   color: Colors.white,
                      //   borderWidth: 1,
                      //   size: const Size(double.infinity, 55),
                      //   icon: Icon(
                      //     Icons.facebook_outlined,
                      //     color: AppColors.whiteColor,
                      //   ),
                      //   label: TextWidget(
                      //     text: 'Continue With facebook',
                      //     textSize: 16,
                      //     color: AppColors.whiteColor,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      const SizedBox(height: 10),
                      CustomOutlinedIconButton(
                        size: const Size(double.infinity, 55),
                        radius: 50,
                        borderWidth: 1,
                        color: Colors.white,
                        icon: Icon(
                          Icons.g_mobiledata,
                          color: AppColors.whiteColor,
                        ),
                        label: TextWidget(
                          text: 'Continue With Google',
                          textSize: 16,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {},
                      ),
                      // const SizedBox(height: 10),
                      // CustomOutlinedIconButton(
                      //   radius: 50,
                      //   borderWidth: 1,
                      //   color: Colors.white,
                      //   size: const Size(double.infinity, 55),
                      //   icon: Icon(
                      //     Icons.apple_outlined,
                      //     color: AppColors.whiteColor,
                      //   ),
                      //   label: TextWidget(
                      //     text: 'Continue With Apple',
                      //     textSize: 16,
                      //     color: AppColors.whiteColor,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: "I don’t have an account ",
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                              textSize: 14),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.signup);
                            },
                            child: const TextWidget(
                              text: "Sign Up",
                              textSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/png/jstdial.png"),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: AppButton.primaryButton(
                title: 'SIGN IN',
                onButtonPressed: () {
                  if (formkey.currentState!.validate()) {
                    // loginMobileController.loginApi(context);
                    // // Get.toNamed(AppRoutes.otp);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
