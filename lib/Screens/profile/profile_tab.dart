import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel_booking/Screens/authentication/login_page.dart';
import 'package:travel_booking/Screens/myTrip/my_trip_tab.dart';
import 'package:travel_booking/Screens/profile/privacyScreen/privacyScreen.dart';
import 'package:travel_booking/Screens/wishlist/wishlist_tab.dart';
import 'package:travel_booking/config/routes/app_routes.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/getStore/get_store.dart';
import 'package:travel_booking/widget/dilogue/logout.dart';

import '../../config/routes/app_pages.dart';
import '../../widget/textwidget/text_widget.dart';
import 'manageAccountScreen/manage_account_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'My Account',
          textSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 12),
                CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 25,
                    child: Icon(
                      Icons.person,
                      color: AppColors.whiteColor,
                    )),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: "${GetStoreData.getStore.read('name')}",
                        textSize: 16),
                    SizedBox(height: 4),
                    TextWidget(
                        text: "${GetStoreData.getStore.read('email')}",
                        textSize: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 31,
                        color: Color.fromRGBO(0, 0, 0, 0.15))
                  ],
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.15)))),
              child: Column(
                children: [
                  profileTabs(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> label = [
    'My Trips',
    'Wishlist',
    'Privacy Policy',
    // 'Rest Password',
    'Manage Account',
    // 'Logout'
  ];

  List<Icon> icon = [
    const Icon(Icons.shop_outlined),
    const Icon(Icons.favorite_outline),
    const Icon(Icons.privacy_tip_outlined),
    // const Icon(Icons.lock_open_outlined),
    const Icon(Icons.settings),
    // const Icon(Icons.logout),
  ];
  List<void Function()?> ontap = [
    () {
      Get.to(() => MyTripTab(),
          transition: transition, duration: transDuration);
    },
    () {
      Get.to(() => WishListTab(),
          transition: transition, duration: transDuration);
    },
    () {
      Get.to(() => PrivacyScreen(),transition: transition, duration: transDuration);
    },
    // () {},
    () {
      Get.to(ManageAccountScreen(),
          transition: transition, duration: transDuration);
    },
    () {
      // showLogoutPopup(Get.context!);
    },
  ];
  Widget profileTabs() {
    ThemeData theme = Theme.of(context);
    return Column(
        children: List.generate(label.length, (index) {
      return ListTile(
        leading: icon[index],
        onTap: ontap[index],
        title: Text(
          label[index],
          style: theme.textTheme.bodyLarge,
        ),
      );
    }));
  }
}
