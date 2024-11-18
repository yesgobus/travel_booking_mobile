import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Screens/home/home_tab.dart';
import 'package:travel_booking/Screens/myTrip/my_trip_tab.dart';
import 'package:travel_booking/Screens/profile/profile_tab.dart';
import 'package:travel_booking/Screens/support/support_tab.dart';
import 'package:travel_booking/Screens/wishlist/wishlist_tab.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';

import '../../widget/textwidget/text_widget.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({
    super.key,
  });

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  List icons = [
    Icons.home_outlined,
    Icons.shop,
    Icons.chat_outlined,
    Icons.favorite_outline,
    Icons.person_outline,
  ];
  List title = [
    "Home",
    "My Trips",
    "Support",
    "Wishlist",
    "Profile",
  ];
  List screen = [
    HomeTab(),
    MyTripTab(),
    SupportTab(),
    WishListTab(),
    ProfileTab(),
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 55,
        padding: EdgeInsets.only(top: 8, bottom: 6, left: 20, right: 20),
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) => InkWell(
              onTap: () {
                selectIndex = index;
                setState(() {});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    size: 22,
                    color: selectIndex == index
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  ),
                  SizedBox(height: 5),
                  TextWidget(
                    text: title[index],
                    textSize: 11,
                    color: selectIndex == index
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    maxLine: 2,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // NavigationBar(
      //   onDestinationSelected: (int index) {
      //     currentIndex = index;
      //     setState(() {});
      //   },
      //   backgroundColor: AppColors.blackColor,
      //   selectedIndex: currentIndex,
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.home_filled),
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.shop_outlined),
      //       selectedIcon: Icon(Icons.shop),
      //       label: 'My Trips',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.chat),
      //       icon: Icon(Icons.chat_outlined),
      //       label: 'Support',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.favorite),
      //       icon: Icon(Icons.favorite_outline),
      //       label: 'Wishlist',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.person),
      //       icon: Icon(Icons.person_outline),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),

      body: screen[selectIndex],
    );
  }

  // int currentTab() => widget.navigationShell.currentIndex;

  // void _goBranch(int index) {
  //   widget.navigationShell.goBranch(
  //     index,
  //     initialLocation: index == widget.navigationShell.currentIndex,
  //   );
  // }
}
