import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/custom_text.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:reminder_app/common/widgets/width_spacer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/common/widgets/xpansion_tile.dart';
import 'package:reminder_app/features/todo/controllers/xpansion_provider.dart';
import 'package:reminder_app/features/todo/pages/add.dart';
import 'package:reminder_app/features/todo/widgets/todo_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 235, 226, 226),
          automaticallyImplyLeading: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(110),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddTask()));
                            },
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
                  hintstyle: appstyle(16, AppConst.kBkDark, FontWeight.bold),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(14.h),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.search,
                        color: AppConst.kBkDark,
                      ),
                    ),
                  ),
                ),
                const HeightSpacer(vhight: 15)
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(children: [
              const HeightSpacer(vhight: 25),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 18,
                    color: AppConst.kLight,
                  ),
                  const WidthSpacer(wide: 10),
                  ReusableText(
                      text: "Today's Task",
                      style: appstyle(18, AppConst.kLight, FontWeight.bold))
                ],
              ),
              const HeightSpacer(vhight: 25),
              Container(
                decoration: BoxDecoration(
                    color: AppConst.kLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius))),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      color: AppConst.kGreyLight,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius))),
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle: appstyle(24, AppConst.kBkLight, FontWeight.w700),
                  unselectedLabelColor: AppConst.kRed,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Pending",
                              style: appstyle(
                                  16, AppConst.kBkDark, FontWeight.bold)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Completed",
                              style: appstyle(
                                  16, AppConst.kBkDark, FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(vhight: 25),
              SizedBox(
                width: AppConst.kWidth,
                height: AppConst.kHeight * 0.3,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        height: AppConst.kHeight * 0.3,
                        color: AppConst.kGreyDk,
                        child: ListView(children: [
                          TodoTile(
                            start: "03:00",
                            end: "05:00",
                            switcher:
                                Switch(value: true, onChanged: (value) {}),
                          ),
                        ]),
                      ),
                      Container(
                        height: AppConst.kHeight * 0.3,
                        color: AppConst.kGreyLight,
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(vhight: 15),
              XpansionTile(
                  text: "Tomorrow's Tasks's",
                  text2: "Tomorrow tasks are shoen here",
                  onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionStateProvider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: ref.watch(xpansionStateProvider)
                          ? const Icon(
                              AntDesign.caretdown,
                              color: AppConst.kLight,
                            )
                          : const Icon(
                              AntDesign.closecircle,
                              color: AppConst.kBlueLight,
                            )),
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "05:00",
                      switcher: Switch(value: true, onChanged: (value) {}),
                    ),
                  ]),
              const HeightSpacer(vhight: 15),
              XpansionTile(
                  text: DateTime.now()
                      .add(const Duration(days: 2))
                      .toString()
                      .substring(5, 10),
                  text2: "Day after tomorrow tasks",
                  onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionState0Provider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: ref.watch(xpansionState0Provider)
                          ? const Icon(
                              AntDesign.caretdown,
                              color: AppConst.kLight,
                            )
                          : const Icon(
                              AntDesign.closecircle,
                              color: AppConst.kBlueLight,
                            )),
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "05:00",
                      switcher: Switch(value: true, onChanged: (value) {}),
                    ),
                  ])
            ]),
          ),
        ));
  }
}
