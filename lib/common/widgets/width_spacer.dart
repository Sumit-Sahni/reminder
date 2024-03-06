import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    super.key,
    required this.wide,
  });
  final double wide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wide,
    );
  }
}
