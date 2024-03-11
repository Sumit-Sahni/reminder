import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth,
      height: AppConst.kHeight,
      color: AppConst.kBkDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/reminder.png"),
          ),
          const HeightSpacer(vhight: 20),
          Column(
            children: [
              ReusableText(
                  text: "Reminder",
                  style: appstyle(30.0, AppConst.kLight, FontWeight.w600))
            ],
          ),
          const HeightSpacer(vhight: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "Welcome!! create task fast with ease",
              textAlign: TextAlign.center,
              style: appstyle(16, AppConst.kGreyDk, FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
