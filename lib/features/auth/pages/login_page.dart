import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/custom_outline_btn.dart';
import 'package:reminder_app/common/widgets/height_spacer.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:reminder_app/common/widgets/custom_text.dart';
import 'package:reminder_app/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

//  Select Countries code
  Country country = Country(
      phoneCode: "1",
      countryCode: "US",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "USA",
      example: "USA",
      displayName: "United States",
      displayNameNoCountryCode: "US",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Image.asset("assets/images/reminder.png"),
              ),
              const HeightSpacer(vhight: 20),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appstyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(vhight: 30),
              // TEXT FIELD
              Center(
                  child: CustomTextField(
                controller: phone,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppConst.kRadius),
                                  topRight: Radius.circular(AppConst.kRadius))),
                          onSelect: (code) {
                            setState(() {});
                          });
                    },
                    child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                hintText: "Enter phone number",
                placeholderStyle:
                    appstyle(16, AppConst.kBkDark, FontWeight.w600),
              )),

              // TEXT FIELD
              const HeightSpacer(vhight: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomBtn(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpPage()));
                  },
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHeight * 0.075,
                  color: AppConst.kBkDark,
                  color2: AppConst.kLight,
                  text: "Send Code",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
