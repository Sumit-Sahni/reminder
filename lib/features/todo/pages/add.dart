import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/custom_outline_btn.dart';
import 'package:reminder_app/common/widgets/custom_text.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(vhight: 20),
            CustomTextField(
              controller: title,
              hintText: "Add Title",
              hintstyle: appstyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
            const HeightSpacer(vhight: 20),
            CustomTextField(
              controller: desc,
              hintText: "Add Description",
              hintstyle: appstyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
            const HeightSpacer(vhight: 20),
            CustomBtn(
                height: 52.h,
                width: AppConst.kWidth,
                color: AppConst.kBlueLight,
                text: "Set Date"),
            const HeightSpacer(vhight: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBtn(
                    height: 52.h,
                    width: AppConst.kWidth * 0.3,
                    color: AppConst.kBlueLight,
                    text: "Start time"),
                CustomBtn(
                    height: 52.h,
                    width: AppConst.kWidth * 0.3,
                    color: AppConst.kBlueLight,
                    text: "End time"),
              ],
            ),
            const HeightSpacer(vhight: 20),
            CustomBtn(
                height: 52.h,
                width: AppConst.kWidth,
                color: AppConst.kGreen,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
