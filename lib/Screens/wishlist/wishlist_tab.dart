import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/homeController/home_controller.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:travel_booking/widget/buttons/button.dart';

import '../../widget/textwidget/text_widget.dart';
import '../packageList/packageListwidget/package_detail_widget.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({super.key});

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
  PackageListController packageListController =
      Get.put(PackageListController());
  @override
  void initState() {
    packageListController.getWishlistedPackage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const TextWidget(
              text: 'WishList', textSize: 18, fontWeight: FontWeight.w500),
        ),
        body: Obx(
          () => packageListController.isLoading.value
              ? Helper.pageLoading()
              : packageListController.packageList.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: packageList(),
                    )
                  : Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(PngAssetPath.wishListAsset,
                              height: 284, width: 284),
                          Text(
                            'Nothing Saved Yet',
                            style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'While exploring, tap on heart icon to wishlist your favourite hotel',
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          // const Spacer(),
                          // Padding(
                          //   padding:
                          //       EdgeInsets.symmetric(horizontal: Get.width / 6, vertical: 8),
                          //   child: AppButton.primaryButton(
                          //     title: 'Start Exploring',
                          //     onButtonPressed: () {},
                          //   ),
                          // ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
        ));
  }

  HomeController homeController = Get.put(HomeController());
  Widget packageList() => SingleChildScrollView(
        child: Column(
          children: List.generate(
            packageListController.packageList.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                child: PackageDetailWidget(
                  index: index,
                  isWishlisht: true,
                ),
                onTap: () {
                  packageListController.selectTravelModal(
                    context: context,
                    index: index,
                    onTap: () {
                      // log(ind.toString());

                      packageListController.getItenary(
                          context: context,
                          destination: packageListController
                              .packageList[index].destination!,
                          packageId:
                              packageListController.packageList[index].id!,
                          hotelId:
                              packageListController.packageList[index].hotelId!,
                          endDate: homeController.returnDate,
                          startDate: homeController.departureDate);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
}
