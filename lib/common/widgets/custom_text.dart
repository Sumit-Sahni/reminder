import 'package:flutter/material.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.hintstyle,
      required this.controller,
      this.onChanged});

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle hintstyle;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth * 0.9,
      decoration: BoxDecoration(
          color: AppConst.kLight,
          borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          cursorHeight: 25,
          onChanged: onChanged,
          style: appstyle(18, AppConst.kBkDark, FontWeight.bold),
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixIconColor: AppConst.kBlueLight,
              hintStyle: hintstyle,
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppConst.kRed))),
        ),
      ),
    );
  }
}
