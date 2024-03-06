import 'package:flutter/material.dart';
import 'package:reminder_app/common/utils/constatnt.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppConst.kWidth,
        height: AppConst.kHeight,
        color: AppConst.kBkDark);
  }
}
