import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../../widget/form_field/input_decoration.dart';

class HolidayTypeWidget extends StatefulWidget {
  const HolidayTypeWidget({super.key});

  @override
  State<HolidayTypeWidget> createState() => _HolidayTypeWidgetState();
}

class _HolidayTypeWidgetState extends State<HolidayTypeWidget> {
  TextEditingController searchController = TextEditingController();

  List<String> tourTypeImg = [
    'assets/images/png/tour.png',
    'assets/images/png/bus.png',
    'assets/images/png/cab.png'
  ];
  List<String> tourTypeTitle = ['Tours', 'Bus', 'Cab'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          MyCustomTextField.textFieldSearch(
              hintText: "Search", controller: searchController),
          const SizedBox(height: 12),
          SizedBox(
            height: 78,
            width: Get.width / 1.7,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: tourTypeImg.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Card(
                          color: index == selectedIndex
                              ? AppColors.primaryColor
                              : AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Image.asset(
                              tourTypeImg[index],
                              color: index == selectedIndex
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        TextWidget(
                            text: tourTypeTitle[index],
                            color: index == selectedIndex
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                            textSize: 14)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SelectHolidayType extends StatefulWidget {
  bool isBlackTheme;
  SelectHolidayType({super.key, required this.isBlackTheme});

  @override
  State<SelectHolidayType> createState() => _SelectHolidayTypeState();
}

class _SelectHolidayTypeState extends State<SelectHolidayType> {
  String selected = '';
  @override
  void initState() {
    selected = holidayType.first;
    super.initState();
  }

  List<String> holidayType = [
    'School Students',
    ' College Student',
    'Corporate'
  ];
  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          color:
              widget.isBlackTheme ? AppColors.blackColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          holidayType.length,
          (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 30,
                  child: Radio<String>(
                      activeColor: AppColors.primaryColor,
                      groupValue: selected,visualDensity: VisualDensity.compact,
                      value: holidayType[index],
                      onChanged: (String? val) {
                        selected = val ?? '';
                        setState(() {});
                      }),
                ),
                TextWidget(
                  text: holidayType[index],
                  textSize: 10,
                  color: widget.isBlackTheme
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
