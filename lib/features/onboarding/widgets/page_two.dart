import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/custom_outline_btn.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/features/auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth,
      height: AppConst.kHeight,
      color: AppConst.kGreyBk,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/reminder.png"),
          ),
          const HeightSpacer(vhight: 40),
          CustomBtn(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            width: AppConst.kWidth * 0.9,
            height: AppConst.kWidth * 0.12,
            text: "Login with a number",
            color: AppConst.kBkDark,
            color2: AppConst.kLight,
          )
        ],
      ),
    );
  }
}
