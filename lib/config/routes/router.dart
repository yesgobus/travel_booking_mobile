// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:travel_booking/config/routes/routes.dart';
// import 'package:travel_booking/modules/authentication/view/screen/login_page.dart';
// import 'package:travel_booking/modules/authentication/view/screen/otp_page.dart';
// import 'package:travel_booking/modules/authentication/view/screen/splash_page.dart';
// import 'package:travel_booking/modules/booking/view/screen/package_description_page.dart';
// import 'package:travel_booking/modules/booking/view/screen/package_list_page.dart';
// import 'package:travel_booking/modules/bottom_navigation/bottom_navigation.dart';
// import 'package:travel_booking/modules/support/view/screen/support_tab.dart';
// import 'package:travel_booking/modules/wishlist/view/screen/wishlist_tab.dart';
// import 'package:travel_booking/modules/home/view/screen/home_tab.dart';
// import 'package:travel_booking/modules/profile/view/screen/profile_tab.dart';
// import 'package:travel_booking/modules/my_trip/view/screen/my_trip_tab.dart';
// import 'package:travel_booking/utils/global_key/global_key.dart';

// GoRouter routeConfig = GoRouter(
//   initialLocation: AppRoute.splash,
//   navigatorKey: navigatorKey,
//   redirect: (BuildContext context, GoRouterState state) {
//     return null;
//   },
//   routes: [
//     GoRoute(
//       path: AppRoute.splash,
//       builder: (BuildContext context, GoRouterState state) {
//         return const SplashPage();
//       },
//       routes: [
//         GoRoute(
//           path: AppRoute.login,
//           name: AppRoute.login,
//           builder: (BuildContext context, GoRouterState state) {
//             return const LoginPage();
//           },
//         ),
//         GoRoute(
//           path: AppRoute.otp,
//           name: AppRoute.otp,
//           builder: (BuildContext context, GoRouterState state) {
//             return const OtpPage();
//           },
//         ),
//       ],
//     ),
//     StatefulShellRoute.indexedStack(
//       builder: (BuildContext context, GoRouterState state,
//           StatefulNavigationShell navigationShell) {
//         return AppBottomNavigation(navigationShell: navigationShell);
//       },
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//                 path: AppRoute.home,
//                 name: AppRoute.home,
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const HomeTab();
//                 },
//                 routes: [
//                   GoRoute(
//                     path: AppRoute.packageListing,
//                     name: AppRoute.packageListing,
//                     parentNavigatorKey: navigatorKey,
//                     builder: (BuildContext context, GoRouterState state) {
//                       return const PackageListPage();
//                     },
//                   ),
//                   GoRoute(
//                     path: AppRoute.packageDesc,
//                     name: AppRoute.packageDesc,
//                     parentNavigatorKey: navigatorKey,
//                     builder: (BuildContext context, GoRouterState state) {
//                       return const PackageDescrptionPage();
//                     },
//                   ),
//                 ]),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: AppRoute.shop,
//               name: AppRoute.shop,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const MyTripTab();
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: AppRoute.chat,
//               name: AppRoute.chat,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const SupportTab();
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: AppRoute.favourite,
//               name: AppRoute.favourite,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const WishListTab();
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: AppRoute.profile,
//               name: AppRoute.profile,
//               builder: (BuildContext context, GoRouterState state) {
//                 return ProfileTab();
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );
