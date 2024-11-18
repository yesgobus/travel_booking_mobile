import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebScreen extends StatefulWidget {
  String bookingID;
  String amt;
  PaymentWebScreen({super.key, required this.bookingID, required this.amt});

  @override
  State<PaymentWebScreen> createState() => _PaymentWebScreenState();
}

class _PaymentWebScreenState extends State<PaymentWebScreen> {
  var webcontroller;
  @override
  void initState() {
    log("booking id ${widget.bookingID}");
    // webcontroller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setUserAgent("random")
    //   ..setOnConsoleMessage((message) {
    //     log(message.message);
    //   })
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Helper.animationLoading();
    //       },
    //       onWebResourceError: (error) {
    //         log("errorrr ${error.description}");
    //       },
    //       onUrlChange: (change) {
    //         // log("messafe ${change.url}");
    //         // if (change.url!.contains('travel-app')) {
    //         //   Uri uri = Uri.parse(change.url!);
    //         //   String token = uri.queryParameters['token']!;
    //         //   String id = uri.queryParameters['userId']!;
    //         //   String phone = uri.queryParameters['phoneNumber']!;
    //         //   String email = uri.queryParameters['email']!;
    //         //   String name = uri.queryParameters['userName']!;
    //         //   GetStoreData.storeUserData(
    //         //       id: id,
    //         //       name: name,
    //         //       email: email,
    //         //       phone: phone,
    //         //       authToken: token);
    //         //   Get.to(AppBottomNavigation());
    //         // }
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(
    //       'https://traveling-payment.onrender.com/?bookingId=${widget.bookingID}&amount=${widget.amt}'));
    super.initState();
  }

//'https://yesgobus.com/'));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webcontroller.canGoBack()) {
          webcontroller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          // floatingActionButton: FloatingActionButton(onPressed: () {
          //   webcontroller.reload();
          // }),
          body: SafeArea(
              child: InAppWebView(
        initialUrlRequest: URLRequest(
            url: WebUri.uri(Uri.parse(
                "https://traveling-payment.onrender.com/?bookingId=${widget.bookingID}&amount=${widget.amt}"))),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture:
                false, // Allow auto playback of media (includes voice/mic)
          ),
        ),
      ))),
    );
  }

  final _key = UniqueKey();
}
