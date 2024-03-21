import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:reminder_app/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.text,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.delete,
      this.switcher});

  final String? text;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius)),
                color: AppConst.kGreyLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    height: 80,
                    width: 5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.kRadius)),
                        // TODO DYNAMIC TODO LISTS
                        color: AppConst.kRed),
                  ),
                  const WidthSpacer(wide: 5),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: AppConst.kWidth * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: text ?? "Title of Todo",
                              style: appstyle(
                                  12, AppConst.kLight, FontWeight.bold)),
                          ReusableText(
                              text: description ?? "Description",
                              style: appstyle(
                                  12, AppConst.kLight, FontWeight.bold)),
                          const HeightSpacer(vhight: 10),
                          Row(
                            children: [
                              Container(
                                width: AppConst.kWidth * 0.3,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.3, color: AppConst.kGreyDk),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppConst.kRadius)),
                                    color: AppConst.kBkDark),
                                child: Center(
                                  child: ReusableText(
                                      text: "$start $end",
                                      style: appstyle(12, AppConst.kLight,
                                          FontWeight.normal)),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: editWidget,
                                  ),
                                  const WidthSpacer(wide: 20),
                                  GestureDetector(
                                    onTap: delete,
                                    child: const Icon(
                                        MaterialCommunityIcons.delete_circle),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ]),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
