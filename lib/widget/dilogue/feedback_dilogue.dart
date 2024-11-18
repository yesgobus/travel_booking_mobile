import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Controllers/bookingControlelr/booking_controller.dart';
import '../../utils/appcolors/app_colors.dart';
import '../../utils/helper/helper.dart';
import '../form_field/input_decoration.dart';
import '../textWidget/text_widget.dart';

class FeedbackDilogue {
  static Future<dynamic> feedbackDilogue(
    BuildContext context,id
  ) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: EdgeInsets.all(0),
          content: NewWidget(id: id,),
        ),
      );
}

class NewWidget extends StatefulWidget {
  String id;
  NewWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  TextEditingController controller = TextEditingController();
  double rating = 3.0;
  BookingController bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 18,
          ),
          TextWidget(
            text: "We Hope You Enjoy Your Trip",
            textSize: 18,
          ),
          const SizedBox(
            height: 12,
          ),
          const TextWidget(
            text: "Rate Us",
            textSize: 13,
          ),
          const SizedBox(
            height: 4,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 26,
            itemPadding: const EdgeInsets.all(0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            onRatingUpdate: (rate) {
              rating = rate;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(width: 12),
              const TextWidget(
                text: "Write Feedback",
                textSize: 13,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MyCustomTextField.textField(
                hintText: "Enter Feedback", controller: controller),
          ),
          const SizedBox(
            height: 12,
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 0,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(false),
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: TextWidget(
                        text: "Close".toUpperCase(),
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        textSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    bookingController.addReview(
                        context, rating, controller.text, widget.id);
                  },
                  child: SizedBox(
                      height: 45,
                      child: Center(
                        child: TextWidget(
                            text: "submit".toUpperCase(),
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            textSize: 14),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
