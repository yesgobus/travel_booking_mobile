import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField(
      {super.key,
      this.onTap,
      this.autovalidateMode,
      this.validation,
      this.controller,
      this.maxLength,
      this.maxLines,
      this.autoFocus = false,
      this.onChanged,
      this.decoration,
      this.focusNode});
  final void Function()? onTap;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validation;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final bool autoFocus;
  final void Function(String)? onChanged;
  final InputDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTap: onTap,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validation,
      maxLength: maxLength,
      maxLines: maxLines,
      autofocus: autoFocus,
      onChanged: onChanged,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(
          RegExp(
              '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      decoration: decoration,
    );
  }
}
