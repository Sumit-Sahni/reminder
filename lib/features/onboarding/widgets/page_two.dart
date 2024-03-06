import 'package:flutter/material.dart';
import 'package:reminder_app/common/utils/constatnt.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppConst.kWidth,
        height: AppConst.kHeight,
        color: AppConst.kGreen);
  }
}
