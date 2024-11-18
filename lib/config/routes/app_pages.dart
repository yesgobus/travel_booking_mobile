import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Screens/authentication/splash_page.dart';
import '../../Screens/authentication/login_page.dart';
import '../../Screens/authentication/otp_page.dart';
import '../../Screens/authentication/signup_page.dart';
import '../../Screens/detailProceedPayment/pkg_detail_proceed.dart';
import '../../Screens/packageDetails/package_description_page.dart';
import '../../Screens/packageList/package_list_page.dart';
import '../../Screens/bottom_navigation/bottom_navigation.dart';
import '../../Screens/home/home_tab.dart';
import '../../Screens/myTrip/my_trip_tab.dart';
import '../../Screens/payment/payment.dart';
import '../../Screens/profile/profile_tab.dart';
import '../../Screens/support/support_tab.dart';
import '../../Screens/wishlist/wishlist_tab.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashPage(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        transition: transition,
        transitionDuration: transDuration),
         GetPage(
        name: AppRoutes.signup,
        page: () => SignupScreen(),
        transition: transition,
        transitionDuration: transDuration),
         GetPage(
        name: AppRoutes.otp,
        page: () => OtpPage(),
        transition: transition,
        transitionDuration: transDuration), 
    GetPage(
        name: AppRoutes.bottomNav,
        page: () => AppBottomNavigation(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.home,
        page: () => HomeTab(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.packageListing,
        page: () => PackageListPage(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.packageDesc,
        page: () => PackageDescrptionPage(),
        transition: transition,
        transitionDuration: transDuration),
         GetPage(
        name: AppRoutes.packageDetailProceed,
        page: () => PackageDetailProceed(),
        transition: transition,
        transitionDuration: transDuration),
         GetPage(
        name: AppRoutes.payment,
        page: () => PaymentScreen(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.shop,
        page: () => MyTripTab(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.chat,
        page: () => SupportTab(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.favourite,
        page: () => WishListTab(),
        transition: transition,
        transitionDuration: transDuration),
    GetPage(
        name: AppRoutes.profile,
        page: () => ProfileTab(),
        transition: transition,
        transitionDuration: transDuration),
  ];
}

Transition transition = Transition.rightToLeftWithFade;
Duration transDuration = const Duration(milliseconds: 400);
