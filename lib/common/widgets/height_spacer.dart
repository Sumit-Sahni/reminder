import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({
    super.key,
    required this.vhight,
  });
  final double vhight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vhight,
    );
  }
}
