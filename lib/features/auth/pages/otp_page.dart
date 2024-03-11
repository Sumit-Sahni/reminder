import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Image.asset("assets/images/reminder.png"),
              ),
              const HeightSpacer(vhight: 26),
              ReusableText(
                  text: "Enter Pin",
                  style: appstyle(18, AppConst.kLight, FontWeight.bold)),
              const HeightSpacer(vhight: 26),
              Pinput(
                length: 6,
                showCursor: true,
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
