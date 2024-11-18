import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Privacy Policy",
          textSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextWidget(
                text:
                    """Welcome to YesGoBus! Before you embark on your journey with us, please take a moment to familiarize yourself with our policies. These policies are designed to ensure a safe, enjoyable, and hassle-free travel experience for all our passengers.""",
                textSize: 14,
                maxLine: 10,
                align: TextAlign.justify,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextWidget(
                      text: "Booking and ReservationsBooking and Reservations",
                      textSize: 18,
                      fontWeight: FontWeight.w500,
                      maxLine: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextWidget(
                  text:
                      """1. Ticket Booking: Tickets can be booked online through our mobile app or website. Ensure that all booking information is accurate to avoid any issues during travel.
2. Cancellation and Refunds: Refer to our cancellation policy for information on cancellations, refunds, and applicable charges. Cancellations can be made through the app or by contacting our customer support.""",
                  textSize: 15,
                  maxLine: 10,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  TextWidget(
                    text: "Baggage and Luggage",
                    textSize: 18,
                    fontWeight: FontWeight.w500,
                    maxLine: 2,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextWidget(
                  text:
                      """1. Carry-On Bags: Passengers are allowed one carry-on bag and one personal item such as a laptop bag or purse. Ensure that your carry-on items comply with our size and weight restrictions.
2. Checked Baggage: Additional charges may apply for checked baggage. Refer to our baggage policy for details on size, weight limits, and fees.""",
                  textSize: 15,
                  maxLine: 10,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  TextWidget(
                    text: "Travel Policies",
                    textSize: 18,
                    fontWeight: FontWeight.w500,
                    maxLine: 2,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextWidget(
                  text:
                      """1. Boarding and Check-In: Arrive at the boarding point at least 30 minutes before departure for check-in and boarding formalities. Late arrivals may result in missed boarding.
2. Travel Documents: Passengers must carry valid identification and travel documents as per government regulations. Failure to present required documents may result in denied boarding.
3. Child and Infant Travel: Refer to our policies for traveling with children and infants, including seat reservations, child fares, and safety regulations.""",
                  textSize: 15,
                  maxLine: 10,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  TextWidget(
                    text: "Customer Support",
                    textSize: 18,
                    fontWeight: FontWeight.w500,
                    maxLine: 2,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextWidget(
                  text:
                      """1. Contact Information: For assistance with bookings, inquiries, or support during your journey, contact our customer support team. Contact details are available on our website and app.
2. Feedback and Complaints: We value your feedback. Share your travel experience with us, including any suggestions or complaints, to help us improve our services.""",
                  textSize: 15,
                  maxLine: 10,
                ),
              ),

              SizedBox(height: 8),
              Row(
                children: [
                  TextWidget(
                    text: "Safety and Security",
                    textSize: 18,
                    fontWeight: FontWeight.w500,
                    maxLine: 2,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextWidget(
                  text:
                      """1. Passenger Safety: Your safety is our priority. Follow safety instructions provided by our staff and adhere to safety regulations during travel.
2. Security Measures: We have implemented security measures to ensure a secure travel environment. Report any suspicious activity or concerns to our staff immediately.""",
                  textSize: 15,
                  maxLine: 10,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  TextWidget(
                    text: "Privacy and Data Protection",
                    textSize: 18,
                    fontWeight: FontWeight.w500,
                    maxLine: 2,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextWidget(
                  text:
                      """1. Data Collection: We collect and use passenger information for booking, travel, and customer service purposes. Refer to our privacy policy for details on data collection, usage, and protection.
2. Data Security: We are committed to protecting your data. We use industry-standard security measures to safeguard your information from unauthorized access or misuse.""",
                  textSize: 15,
                  maxLine: 10,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
