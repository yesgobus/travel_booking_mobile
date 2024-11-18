import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class DestinationCard extends StatelessWidget {
  final String destinationName;
  final double rating;
  final int price;
  final String imagePath;

  const DestinationCard({
    super.key,
    required this.destinationName,
    required this.rating,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.network(
            imagePath,
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.black.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        destinationName,
                        style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Rs ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        '$price',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextWidget(
                          text: " Starting ",
                          color: AppColors.whiteColor,
                          textSize: 10),
                      Icon(
                        Icons.star,
                        color: AppColors.yellowColor,
                        size: 13,
                      ),
                      TextWidget(
                          text: "4.8",
                          color: AppColors.whiteColor,
                          textSize: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
