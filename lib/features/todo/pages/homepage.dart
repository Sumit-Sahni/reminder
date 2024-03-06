import 'package:flutter/material.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:reminder_app/common/widgets/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
                text: "Todo ",
                style: appstyle(20, AppConst.kGreen, FontWeight.w500)),
            const HeightSpacer(vhight: 10),
            const WidthSpacer(wide: 50),
            ReusableText(
                text: "Todo ",
                style: appstyle(20, AppConst.kGreen, FontWeight.w500)),
            const HeightSpacer(vhight: 10),
            const WidthSpacer(wide: 50),
            ReusableText(
                text: "Todo ",
                style: appstyle(20, AppConst.kGreen, FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
