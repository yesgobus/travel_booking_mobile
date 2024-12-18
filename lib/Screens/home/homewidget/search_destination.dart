
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Screens/home/homewidget/holiday_day_type.dart';
import 'package:travel_booking/config/routes/app_routes.dart';
import 'package:travel_booking/config/routes/routes.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/form_field/custom_text_form_field.dart';
import 'package:travel_booking/widget/form_field/input_decoration.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../../Controllers/packageListController/package_listing_Controller.dart';
import '../../../Model/AddressModel/search_address_details.dart';
import '../../../Model/AddressModel/search_responce_model.dart';
import '../../../utils/placeService/place_services.dart';
import '../../../widget/datePicker/datePicker.dart';
import '../../../widget/dropdownWidget/drop_down_widget.dart';

class SearchDestinationWidget extends StatefulWidget {
  const SearchDestinationWidget({super.key});

  @override
  State<SearchDestinationWidget> createState() =>
      _SearchDestinationWidgetState();
}

class _SearchDestinationWidgetState extends State<SearchDestinationWidget> {
  HomeController homeController = Get.put(HomeController());

  final placesService = PlacesService();
  List<Prediction> searchResults = [];
  bool startsearchClear = true;
  bool endsearchClear = true;
  String startlat = "";
  String startlng = "";
  String endlat = "";
  String endlng = "";
  void swapAddresses() {
    String temp = homeController.startDestController.text;
    homeController.startDestController.text =
        homeController.endDestController.text;
    homeController.endDestController.text = temp;
  }

  @override
  void initState() {
    homeController.departureDate =
        DateFormat('MMM dd, yyyy').format(DateTime.now());
    homeController.returnDate = DateFormat('MMM dd, yyyy')
        .format(DateTime.now().add(Duration(days: 3)));
    homeController.departureDatePost =
        Helper.formatDatePost(DateTime.now().toString());
    homeController.returnDatePost =
        Helper.formatDatePost(DateTime.now().add(Duration(days: 3)).toString());
    homeController.adultController.text = "2";
    homeController.roomController.text = "1";
    super.initState();
  }

  GlobalKey<FormState> formkey = GlobalKey();
  PackageListController packageListController =
  Get.put(PackageListController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "From",
                        textSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                      MyCustomTextField.textFieldUnderline(
                          controller: homeController.startDestController,
                          hintText: "From City",
                          borderClr: AppColors.whiteColor,
                          textClr: AppColors.whiteColor,
                          valText: "Please Enter From City",
                          onChanged: (val) {
                            startsearchClear = val.isEmpty;
                            placesService.getAutocomplete(val).then((value) {
                              final searchResponse =
                              searchAddressListFromJson(value);

                              searchResults = searchResponse.predictions!;
                            });
                            setState(() {});
                          }),

                      // Visibility(
                      //   visible: !startsearchClear && startDestController.text.isNotEmpty,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 16, right: 16),
                      //     child: Container(
                      //       height: Get.height * 0.3,
                      //       width: Get.width,
                      //       decoration: BoxDecoration(
                      //         color: AppColors.whiteColor,
                      //       ),
                      //       child: ListView.builder(
                      //         itemCount: searchResults.length,
                      //         itemBuilder: (context, index) {
                      //           return Column(
                      //             children: [
                      //               ListTile(
                      //                 dense: true,
                      //                 visualDensity:
                      //                     const VisualDensity(horizontal: 0, vertical: -4),
                      //                 contentPadding:
                      //                     const EdgeInsets.only(left: 12, right: 12),
                      //                 title: Text(
                      //                   // change
                      //                   searchResults[index].description.toString(),
                      //                   style: TextStyle(
                      //                       color: AppColors.blackColor, fontSize: 16),
                      //                 ),
                      //                 onTap: () async {
                      //                   setState(() {
                      //                     startsearchClear = true;
                      //                     String id =
                      //                         searchResults[index].placeId.toString();
                      //                     placesService.getPlace(id).then((value) async {
                      //                       final searchResponse =
                      //                           searchAddressDetailsFromJson(value);

                      //                       startlat = searchResponse
                      //                           .result!.geometry!.location!.lat
                      //                           .toString();
                      //                       startlng = searchResponse
                      //                           .result!.geometry!.location!.lng
                      //                           .toString();
                      //                       startDestController.text =
                      //                           searchResults[index].description!;
                      //                     });
                      //                   });
                      //                 },
                      //               ),
                      //               Divider(
                      //                 color: AppColors.black45,
                      //                 height: 4,
                      //               )
                      //             ],
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    swapAddresses();
                  },
                  child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.black65,
                      child: Icon(
                        Icons.swap_horiz,
                        color: AppColors.whiteColor,
                      )),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        text: "To",
                        textSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),

                      MyCustomTextField.textFieldUnderline(
                          controller: homeController.endDestController,
                          textalign: TextAlign.right,
                          borderClr: AppColors.whiteColor,
                          textClr: AppColors.whiteColor,
                          hintText: "To City",
                          valText: "Please Enter To City",
                          onChanged: (val) {
                            endsearchClear = val.isEmpty;
                            placesService.getAutocomplete(val).then((value) {
                              final searchResponse =
                              searchAddressListFromJson(value);

                              searchResults = searchResponse.predictions!;
                            });
                            setState(() {});
                          }),

                      // Visibility(
                      //   visible: !endsearchClear && endDestController.text.isNotEmpty,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 16, right: 16),
                      //     child: Container(
                      //       height: Get.height * 0.3,
                      //       width: Get.width,
                      //       decoration: BoxDecoration(
                      //         color: AppColors.whiteColor,
                      //       ),
                      //       child: ListView.builder(
                      //         itemCount: searchResults.length,
                      //         itemBuilder: (context, index) {
                      //           return Column(
                      //             children: [
                      //               ListTile(
                      //                 dense: true,
                      //                 visualDensity:
                      //                     const VisualDensity(horizontal: 0, vertical: -4),
                      //                 contentPadding:
                      //                     const EdgeInsets.only(left: 12, right: 12),
                      //                 title: Text(
                      //                   // change
                      //                   searchResults[index].description.toString(),
                      //                   style: TextStyle(
                      //                       color: AppColors.blackColor, fontSize: 16),
                      //                 ),
                      //                 onTap: () async {
                      //                   setState(() {
                      //                     endsearchClear = true;
                      //                     String id =
                      //                         searchResults[index].placeId.toString();
                      //                     placesService.getPlace(id).then((value) async {
                      //                       final searchResponse =
                      //                           searchAddressDetailsFromJson(value);

                      //                       endlat = searchResponse
                      //                           .result!.geometry!.location!.lat
                      //                           .toString();
                      //                       endlng = searchResponse
                      //                           .result!.geometry!.location!.lng
                      //                           .toString();
                      //                       endDestController.text =
                      //                           searchResults[index].description!;
                      //                     });
                      //                   });
                      //                 },
                      //               ),
                      //               Divider(
                      //                 color: AppColors.black45,
                      //                 height: 4,
                      //               )
                      //             ],
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectDate(context, DateTime.now(),
                            otherDate: homeController.toDate,
                            isFromDate: true)
                            .then((value) {
                          homeController.fromDate = value!;
                          homeController.departureDatePost =
                              Helper.formatDatePost(value.toString());
                          homeController.departureDate =
                              DateFormat('MMM dd, yyyy').format(value);
                          setState(() {});
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Departure",
                            textSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 4),
                          TextWidget(
                            text: homeController.departureDate,
                            textSize: 17,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectDate(context, DateTime.now(),
                            otherDate: homeController.fromDate,
                            isFromDate: false)
                            .then((value) {
                          homeController.toDate = value!;
                          homeController.returnDatePost =
                              Helper.formatDatePost(value.toString());
                          homeController.returnDate =
                              DateFormat('MMM dd, yyyy').format(value);
                          setState(() {});
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Return",
                            textSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 4),
                          TextWidget(
                            text: homeController.returnDate,
                            textSize: 17,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                adultRoomSelect();
              },
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: "Rooms & Guests",
                        textSize: 12,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 4),
                    TextWidget(
                      text:
                      "${homeController.adultController.text} Adults, ${homeController.roomController.text} Room",
                      textSize: 17,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 12),
            // SelectHolidayType(
            //   isBlackTheme: false,
            // ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: AppButton.primaryButton(
                title: 'Search',
                onButtonPressed: () {
                  if (formkey.currentState!.validate()) {
                    packageListController
                        .getPackage(
                        destination: homeController.endDestController.text)
                        .then((value) {});

                    Get.toNamed(AppRoutes.packageListing);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  adultRoomSelect() {
    return Get.defaultDialog(
        backgroundColor: Colors.white,
        title: "",
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: "Adult",
                            textSize: 12,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 4),
                        MyCustomTextField.textField(
                            textInputType: TextInputType.phone,
                            hintText: "Adult",
                            controller: homeController.adultController),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: "Room",
                            textSize: 12,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 4),
                        MyCustomTextField.textField(
                            textInputType: TextInputType.phone,
                            hintText: "Room",
                            controller: homeController.roomController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Divider(),
            SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                Get.back();
                setState(() {});
              },
              child: Container(
                width: Get.width,
                height: 20,
                child: Center(
                  child: TextWidget(
                    text: "DONE",
                    textSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
