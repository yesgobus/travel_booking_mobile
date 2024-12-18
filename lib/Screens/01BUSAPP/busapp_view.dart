import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../utils/constant/png_asset_constant.dart';
import '../../widget/dilogue/exit_dilogue.dart';
import '../../widget/textwidget/text_widget.dart';
import 'package:travel_booking/Screens/bottom_navigation/bottom_navigation.dart';
import 'package:travel_booking/utils/getStore/get_store.dart';
import 'package:travel_booking/utils/helper/helper.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingBusAppScreen extends StatefulWidget {
  const LandingBusAppScreen({super.key});

  @override
  State<LandingBusAppScreen> createState() => _LandingBusAppScreenState();
}

class _LandingBusAppScreenState extends State<LandingBusAppScreen>
    with SingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;
  late AnimationController _controller;
  late Animation<double> _animation;
  InAppWebViewController? webViewController;
  bool _firstLoad = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> requestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status.isGranted) {
      print('Microphone permission granted');
    } else {
      print('Microphone permission denied');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController!.canGoBack()) {
          webViewController!.goBack();
          return false;
        } else {
          return showExitPopup(context).then((value) {
            return value;
          });
        }
      },
      child: Scaffold(
        body: Obx(() => SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // WebView Content
              InAppWebView(
                initialUrlRequest: URLRequest(
                    url: WebUri.uri(Uri.parse("https://yesgobus-mobile.netlify.app/"))),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false,
                  ),
                ),
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadError: (controller, url, code, message) {
                  print('onLoadError: $url, code: $code, message: $message');
                  setState(() {
                    isLoading.value = false;
                  });
                },
                onUpdateVisitedHistory: (controller, change, isReload) {
                  if (change.toString().contains('tel')) {
                    Uri uri = Uri.parse(change.toString());
                    String tel = uri.queryParameters['tel']!;
                    Helper.launchPhone(tel);
                  } else if (change.toString().contains('mailto')) {
                    Uri uri = Uri.parse(change.toString());
                    String mail = uri.queryParameters['mailto']!;
                    Helper.launchMail(mail);
                  }
                  if (change.toString().contains('travel-app')) {
                    Uri uri = Uri.parse(change.toString());
                    String token = uri.queryParameters['token']!;
                    String id = uri.queryParameters['userId']!;
                    String phone = uri.queryParameters['phoneNumber']!;
                    String email = uri.queryParameters['email']!;
                    String name = uri.queryParameters['userName']!;
                    GetStoreData.storeUserData(
                      id: id,
                      name: name,
                      email: email,
                      phone: phone,
                      authToken: token,
                    );
                    Get.to(AppBottomNavigation());
                  }
                },
                onLoadStop: (controller, Uri? change) async {
                  log("message $change");

                  if (_firstLoad) {
                    setState(() {
                      _controller.forward().then((val) {
                        isLoading.value = false;
                      });
                      _firstLoad = false;
                    });
                    requestMicrophonePermission();
                  }
                },
                androidOnPermissionRequest: (InAppWebViewController controller, String origin,
                    List<String> resources) async {
                  return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT,
                  );
                },
              ),

              // Splash Screen (Logo)
              isLoading.value
                  ? Container(
                height: Get.height,
                width: Get.width,
                color: Colors.orange[900],
                child: ScaleTransition(
                  scale: _animation,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          PngAssetPath.splashLogo,
                          height: 130,
                          width: 180,
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  : SizedBox(),
            ],
          ),
        )),
      ),
    );
  }

  final _key = UniqueKey();
}
