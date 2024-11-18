import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/getStore/get_store.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:20),
              TextWidget(
                text: 'Hi, ${GetStoreData.getStore.read('name')??""}',
                textSize: 16,
                color: AppColors.whiteColor,
              ),
              TextWidget(
                text: "Where You Wana go?",
                textSize: 22,color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          // Container(
          //     padding: const EdgeInsets.all(5),
          //     decoration: BoxDecoration(
          //         color: AppColors.grey2Color,
          //         borderRadius: BorderRadius.circular(50)),
          //     child: const Icon(Icons.notifications_none))
        ],
      ),
    );
  }
}
