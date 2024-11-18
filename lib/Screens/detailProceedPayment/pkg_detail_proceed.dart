import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Screens/detailProceedPayment/detailProceedWidget/grandTotoalWidget.dart';
import 'package:travel_booking/Screens/detailProceedPayment/detailProceedWidget/promocode.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/dropdownWidget/drop_down_widget.dart';
import 'package:travel_booking/widget/form_field/input_decoration.dart';

import '../../widget/textwidget/text_widget.dart';
import '../home/homewidget/holiday_day_type.dart';

class PackageDetailProceed extends StatefulWidget {
  const PackageDetailProceed({super.key});

  @override
  State<PackageDetailProceed> createState() => _PackageDetailProceedState();
}

class _PackageDetailProceedState extends State<PackageDetailProceed> {
  HomeController homeController = Get.find();
  @override
  void initState() {
    bookingController.personDetail.clear();
    for (var i = 0; i < int.parse(homeController.adultController.text); i++) {
      bookingController.personDetail.add(PersonDetail(
          selectedGender: "Male",
          fullname: TextEditingController(),
          age: TextEditingController()));
    }
    super.initState();
  }

  BookingController bookingController = Get.put(BookingController());
  PackageListController packageListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.grey2Color,
          child: Column(
            children: [
              Stack(children: [
                Image.network(
                  packageListController.selectedPackage.image!,
                  width: Get.width,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: AppColors.blackColor.withOpacity(0.3),
                  height: 180,
                  width: Get.width,
                  child: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: AppColors.whiteColor)),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextWidget(
                                  text:
                                      "Amazing ${packageListController.selectedPackage.destination} ${packageListController.withFlight == true ? "Flight" : "Without Flight"} Inclusive Deal ${packageListController.selectedPackage.totalDuration}",
                                  fontWeight: FontWeight.w500,
                                  textSize: 20,
                                  maxLine: 2,
                                  align: TextAlign.center,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: null,
                                icon: Icon(Icons.arrow_back,
                                    color: AppColors.transparentColor)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextWidget(
                            text: "${packageListController.packageTagline}",
                            textSize: 12,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500),
                        const Spacer(),
                        const SizedBox(
                          height: 12,
                        ),
                        // Container(
                        //   child: const TextWidget(
                        //     text: "Edit",
                        //     textSize: 16,
                        //     color: AppColors.primaryColor,
                        //   ),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: AppColors.primaryColor),
                        //       borderRadius: BorderRadius.circular(4)),
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8, vertical: 4),
                        // ),
                        // const Spacer(),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 12, vertical: 12),
                        //   child: SelectHolidayType(isBlackTheme: true),
                        // )
                      ],
                    ),
                  ),
                )
              ]),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    TextWidget(
                        text: "Review package",
                        textSize: 16,
                        fontWeight: FontWeight.w500),
                    // TextWidget(
                    //   text:
                    //       "1. TRAVELLER DETAILS 2. PACKAGE ITINERARY & INCLUSION 3. CANCELLATION & DATE CHANGE",
                    //   maxLine: 3,
                    //   textSize: 10,
                    //   align: TextAlign.center,
                    // ),
                    // SizedBox(height: 2),
                  ],
                ),
              ),
              Form(
                key: bookingController.formkey,
                child: Container(
                  width: Get.width,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.black45),
                      color: AppColors.whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text:
                                  "Amazing ${packageListController.selectedPackage.destination} ${packageListController.withFlight == true ? "Flight" : "Without Flight"} Inclusive Deal ${packageListController.selectedPackage.totalDuration}",
                              textSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            // const SizedBox(height: 8),
                            // TextWidget(
                            //     text: "Customizable 3​​​N Goa ​​​",
                            //     textSize: 13,
                            //     color: AppColors.black65),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                TextWidget(
                                    text: homeController.departureDate,
                                    textSize: 13,
                                    color: AppColors.black65),
                                const Expanded(child: Divider()),
                                Container(
                                  child: TextWidget(
                                      text:
                                          "${packageListController.selectedPackage.totalDuration}",
                                      textSize: 12),
                                  decoration: BoxDecoration(
                                      color: AppColors.grey4Color,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                ),
                                const Expanded(child: Divider()),
                                TextWidget(
                                    text:
                                        "${homeController.returnDate} / From ${bookingController.bookingData.value!.toPlace}",
                                    textSize: 13,
                                    color: AppColors.black65),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextWidget(
                                text:
                                    "${bookingController.bookingData.value!.totalRoom} Room - ${bookingController.bookingData.value!.totalGuests} Adults",
                                textSize: 13,
                                color: AppColors.blackColor),
                            // const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      // const Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      //   child: TextWidget(
                      //       text: "1. Traveller Details",
                      //       textSize: 16,
                      //       fontWeight: FontWeight.w500),
                      // ),
                      // const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: TextWidget(
                            text:
                                "Travellers - ${homeController.roomController.text} Room | ${homeController.adultController.text} Adults",
                            textSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: bookingController.personDetail.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                    text: "Traveller ${index + 1}",
                                    textSize: 15),
                                const SizedBox(height: 8),
                                const TextWidget(
                                    text: "Full name", textSize: 14),
                                const SizedBox(height: 6),
                                MyCustomTextField.textField(
                                    hintText: "Enter Full Name",
                                    valText: "Please Enter Full Name",
                                    controller: bookingController
                                        .personDetail[index].fullname),
                                const SizedBox(height: 8),
                                const TextWidget(text: "Age", textSize: 14),
                                const SizedBox(height: 6),
                                MyCustomTextField.textField(
                                    hintText: "Enter Age",
                                    valText: "Please Enter Age",
                                    controller: bookingController
                                        .personDetail[index].age,
                                    textInputType: TextInputType.phone),
                                const SizedBox(height: 8),
                                const TextWidget(text: "Gender", textSize: 14),
                                const SizedBox(height: 6),
                                DropDownWidget(
                                    status: bookingController
                                        .personDetail[index].selectedGender,
                                    statusList: genderList,
                                    onChanged: (val) {
                                      bookingController.personDetail[index]
                                          .selectedGender = val!;
                                      setState(() {});
                                    })
                              ],
                            ),
                          );
                        },
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                                text: "Please enter contact details",
                                textSize: 16,
                                fontWeight: FontWeight.w500),
                            const SizedBox(height: 8),
                            const TextWidget(text: "Email", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textField(
                                hintText: "Enter Email",
                                valText: "Please Enter Email",
                                controller: bookingController.email),
                            const SizedBox(height: 8),
                            const TextWidget(
                                text: "Mobile Number", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textFieldPhone(
                                hintText: "Enter Mobile Number",
                                valText: "Please Enter Mobile Number",
                                borderRadius: 15,
                                textClr: AppColors.black65,
                                controller: bookingController.mobilenum),
                            const SizedBox(height: 8),
                            const TextWidget(
                                text: "Alternative Number", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textFieldPhone(
                                hintText: "Enter Alternative Number",
                                valText:
                                    "Please Enter Alternative Mobile Number",
                                borderRadius: 15,
                                textClr: AppColors.black65,
                                controller:
                                    bookingController.alternatemobilenum),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                                text: "Please enter GST details",
                                textSize: 16,
                                fontWeight: FontWeight.w500),
                            const SizedBox(height: 8),
                            const TextWidget(text: "Pincode", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textField(
                                hintText: "Enter Pincode",
                                valText: "Please Enter Pincode",
                                textInputType: TextInputType.phone,
                                controller: bookingController.pincode),
                            const SizedBox(height: 8),
                            const TextWidget(text: "State", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textField(
                                hintText: "Enter State",
                                valText: "Please Enter State",
                                controller: bookingController.state),
                            const SizedBox(height: 8),
                            const TextWidget(text: "Address", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textField(
                                hintText: "Your address(Optional)",
                                controller: bookingController.address),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                                text: "Special Requests",
                                textSize: 16,
                                fontWeight: FontWeight.w500),
                            const SizedBox(height: 8),
                            const TextWidget(
                                text: "Special Requests", textSize: 14),
                            const SizedBox(height: 6),
                            MyCustomTextField.textField(
                                hintText: "Enter Special Requests",
                                controller: bookingController.specialReq),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12)
                    ],
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              //   margin: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: AppColors.black45),
              //       borderRadius: BorderRadius.circular(6),
              //       color: AppColors.whiteColor),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       TextWidget(
              //         text: "2. Package Itinerary & Inclusions",
              //         textSize: 16,
              //         fontWeight: FontWeight.w500,
              //       ),
              //       Icon(Icons.keyboard_arrow_down_outlined)
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              //   margin: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: AppColors.black45),
              //       borderRadius: BorderRadius.circular(6),
              //       color: AppColors.whiteColor),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       TextWidget(
              //         text: "3. Cancellation & Date Change",
              //         textSize: 16,
              //         fontWeight: FontWeight.w500,
              //       ),
              //       Icon(Icons.keyboard_arrow_down_outlined)
              //     ],
              //   ),
              // ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    PromoCodeWidget(),
                    SizedBox(height: 12),
                    GrandTotalWidget(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   log(jsonEncode(personDetail).toString());
      // }),
    );
  }

  List<String> genderList = ["Male", "Femals", "Others"];
}

class PersonDetail {
  String selectedGender = "Male";
  TextEditingController fullname = TextEditingController();
  TextEditingController age = TextEditingController();
  PersonDetail(
      {required this.selectedGender,
      required this.fullname,
      required this.age});

  Map<String, dynamic> toJson() => {
        "gender": selectedGender,
        "fullname": fullname.text,
        "age": age.text,
      };
}
