import 'package:flutter/material.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../utils/appcolors/app_colors.dart';

class MyCustomTextField {
  static Widget textField({
    required String hintText,
    String? valText,
    int? maxLine,
    bool readonly = false,
    Color? borderClr,
    double? borderRadius,
    Color? fillColor,
    Color? textClr,
    Widget? prefixIcon,
    Function()? onTap,
    Function(String val)? onChanged,
    required TextEditingController controller,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      readOnly: readonly,
      maxLines: maxLine ?? 1,
      controller: controller,
      onChanged: onChanged,
      maxLength: textInputType == TextInputType.phone ? 10 : null,
      keyboardType: textInputType,
      style: TextStyle(
        color: textClr ?? AppColors.blackColor,
        fontSize: 14,
      ),
      validator: (value) {
        if (value == '') {
          if (valText != null) {
            return valText;
          }
        }
        return null;
      },
      onTap: onTap,
      
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: textClr ?? AppColors.black65,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          counterText: "",
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          prefixIcon: prefixIcon),
    );
  }

  static Widget textFieldUnderline({
    required String hintText,
    String? valText,
    int? maxLine,
    bool readonly = false,
    Color? borderClr,
    double? borderRadius,
    Color? fillColor,
    Color? textClr,
    Widget? prefixIcon,
    TextAlign?textalign,
    Function()? onTap,
    Function(String val)? onChanged,
    required TextEditingController controller,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      readOnly: readonly,
      maxLines: maxLine ?? 1,
      controller: controller,
      onChanged: onChanged,
      maxLength: textInputType == TextInputType.phone ? 10 : null,
      keyboardType: textInputType,
      textAlign:  textalign??TextAlign.left,
      style: TextStyle(
        color: textClr ?? AppColors.blackColor,
        fontSize: 14,
      ),
      validator: (value) {
        if (value == '') {
          if (valText != null) {
            return valText;
          }
        }
        return null;
      },
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: textClr ?? AppColors.black65,
            fontSize: 14,
          ),
          enabledBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          focusedBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          disabledBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          border: UnderlineInputBorder(
              // borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          errorBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          focusedErrorBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
          counterText: "",errorStyle: TextStyle(color: AppColors.whiteColor),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          prefixIcon: prefixIcon),
    );
  }

  static textFieldPhone({
    required String hintText,
    String? valText,
    int? maxLine,
    bool readonly = false,
    Color? borderClr,
    Color? fillColor,
    Color? textClr,
    double? borderRadius,
    required TextEditingController controller,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      readOnly: readonly,
      maxLines: maxLine ?? 1,
      controller: controller,
      style: TextStyle(
        color: textClr ?? AppColors.blackColor,
        fontSize: 14,
      ),
      maxLength: 10,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == '') {
          if (valText != null) {
            return valText;
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: textClr ?? AppColors.black65,
          fontSize: 14,
        ),
        constraints: BoxConstraints(minHeight: 40),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
            borderSide: BorderSide(color: borderClr ?? AppColors.blackColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
            borderSide: BorderSide(color: borderClr ?? AppColors.blackColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
            borderSide: BorderSide(color: borderClr ?? AppColors.blackColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 100.0),
          borderSide: BorderSide(color: borderClr ?? AppColors.blackColor),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide(color: borderClr ?? AppColors.black65)),
        counterText: "",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        prefixIcon: SizedBox(
            width: 60,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                    text: "+91",
                    align: TextAlign.center,
                    color: borderClr ?? AppColors.blackColor,
                    textSize: 16),
                const SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 1.5,
                  color: borderClr ?? AppColors.black65,
                ),
                const SizedBox(width: 10),
              ],
            ))),
        prefixStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  static textFieldSearch({
    required String hintText,
    String? valText,
    int? maxLine,
    bool readonly = false,
    Color? borderClr,
    Color? fillColor,
    Color? textClr,
    required TextEditingController controller,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      readOnly: readonly,
      maxLines: maxLine ?? 1,
      controller: controller,
      maxLength: textInputType == TextInputType.phone ? 10 : null,
      keyboardType: textInputType,
      validator: (value) {
        if (value == '') {
          if (valText != null) {
            return valText;
          }
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: textClr ?? AppColors.black65,
            fontSize: 13,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.grey3Color)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.grey3Color)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.grey3Color)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: AppColors.grey1Color,
          constraints: BoxConstraints(maxHeight: 45),
          suffixIcon: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Icon(
                Icons.search,
                color: AppColors.whiteColor,
              ),
            ),
          )),
    );
  }
}

class CustomInputDecoration {
  CustomInputDecoration._internal();
  static InputDecoration outlineInputDecoration(
      {String? labelText,
      Widget? suffixIcon,
      String? hintText,
      Widget? prefixIcon,
      String? helperText,
      String? prefixText,
      bool enable = true,
      double borderRadius = 22,
      InputBorder? focusBorder}) {
    return InputDecoration(
      enabled: enable,
      errorMaxLines: 2,
      prefixText: prefixText,
      helperMaxLines: 3,
      counterText: '',
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
      prefixStyle: const TextStyle(color: Colors.black, fontSize: 14),
      labelStyle: const TextStyle(color: Colors.black),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedBorder: focusBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
    );
  }

  static InputDecoration filledDecoration({
    String? labelText,
    Widget? suffixIcon,
    String? hintText,
    Widget? prefixIcon,
    String? helperText,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: UnderlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
