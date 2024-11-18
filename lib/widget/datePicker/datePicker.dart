import 'package:flutter/material.dart';
import 'package:travel_booking/utils/helper/helper_sncksbar.dart';

Future<DateTime?> selectDate(BuildContext context, DateTime selectedDate,
    {DateTime? otherDate, bool isFromDate = true}) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2200));

  if (picked != null) {
    if (isFromDate) {
      // Validate that 'fromDate' is not after 'toDate'
      if (otherDate != null && picked.isAfter(otherDate)) {
        HelperSnackBar.snackBar("Error", "Departure date cannot be after Return date");
        return null;
      }
    } else {
      // Validate that 'toDate' is not before 'fromDate'
      if (otherDate != null && picked.isBefore(otherDate)) {
        // Show an error (e.g., using a snackbar or dialog)
        HelperSnackBar.snackBar("Error", "Return date cannot be before Departure date");
        return null;
      }
    }
    return picked;
  }
  return null;
}
