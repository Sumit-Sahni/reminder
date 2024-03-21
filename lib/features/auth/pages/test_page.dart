import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminder_app/common/utils/constatnt.dart';
import 'package:reminder_app/common/widgets/appstyle.dart';
import 'package:reminder_app/common/widgets/reusable_text.dart';
import 'package:reminder_app/features/auth/controllers/code_provider.dart';

class TextPage extends ConsumerWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(
                text: code,
                style: appstyle(16, AppConst.kLight, FontWeight.w700)),
            TextButton(
                onPressed: () {
                  ref.read(codeStateProvider.notifier).setStart("Hello Sumit");
                },
                child: const Text("Click ME"))
          ],
        ),
      ),
    );
  }
}
