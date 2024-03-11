import 'package:flutter/material.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/custom_text.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:reminder_app/common/widgets/width_spacer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 235, 226, 226),
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: "Dashboard",
                          style:
                              appstyle(16, AppConst.kLight, FontWeight.bold)),
                      Container(
                        width: 26.w,
                        height: 26.h,
                        decoration: const BoxDecoration(
                            color: AppConst.kLight,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            color: AppConst.kBkDark,
                          ),
                        ),
                      )
                    ],
                  )),
              const HeightSpacer(vhight: 20),
              CustomTextField(
                controller: search,
                hintText: "Seacrh",
                placeholderStyle:
                    appstyle(16, AppConst.kBkDark, FontWeight.bold),
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.search,
                      color: AppConst.kBkDark,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
