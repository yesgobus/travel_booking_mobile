import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../../config/routes/app_pages.dart';
import 'delete_account.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Account Managment",
          textSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          ListTile(
            title: TextWidget(
              text: "Delete Account",
              textSize: 16,
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              Get.to(DeleteAccountScreen(),transition: transition, duration: transDuration);
            },
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            subtitle: TextWidget(
                text:
                    "You wont be able to reactivate or retrieve any content or information you have added",
                textSize: 14),
          ),
        ],
      ),
    );
  }
}
