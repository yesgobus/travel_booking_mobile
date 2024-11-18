import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking/Controllers/packageListController/package_listing_Controller.dart';
import 'package:travel_booking/Model/packageListModel/package_list_model.dart';

class SelectTravelModal extends StatefulWidget {
  SelectTravelModal({super.key, required this.index, required this.onTap});
  Function() onTap;
  int index;
  @override
  State<SelectTravelModal> createState() => _SelectTravelModalState();
}

class _SelectTravelModalState extends State<SelectTravelModal> {
  int selected = 0;
  PackageListController packageListController =
      Get.put(PackageListController());
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
              'Amazing ${packageListController.packageList[widget.index].destination} Flight Inclusive Deal ${packageListController.packageList[widget.index].totalDuration}',
              style: theme.textTheme.bodyMedium),
        ),
        const Divider(),
        buttons(),
        const Divider(),
        SizedBox(
            height: 35,
            child: OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'))),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buttons() {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(2, (index) {
        return InkWell(
            onTap: () {
              selected = index;
              widget.onTap();
              if (index == 0) {
                packageListController.withFlight = true;
              } else {
                packageListController.withFlight = false;
              }
              packageListController.selectedPackage =
                  packageListController.packageList[widget.index];
              setState(() {});
            },
            child: fightOption(theme, index));
      }),
    );
  }

  Widget fightOption(ThemeData theme, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: index == selected ? Colors.grey[200] : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.22),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Starting from - New Delhi',
            //   style: theme.textTheme.bodySmall,
            // ),
            // const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  index == 0 ? 'With Flight' : 'Without Flight',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  index == 0
                      ? "₹ ${packageListController.packageList[widget.index].witheFlitePrice!}"
                      : "₹ ${packageListController.packageList[widget.index].withoutFlitePrice!}",
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
}
