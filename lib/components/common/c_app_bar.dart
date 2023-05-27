import 'package:flutter/material.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/space.dart';
import 'package:trade_brains/utils/text.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget widget;
  const CommonAppbar({
    super.key,
    required this.title,
    this.widget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: kwhite,
      ),
      backgroundColor: blackBG.withOpacity(0.9),
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: textstyle(
          17,
          FontWeight.w600,
          kwhite,
        ),
      ),
      actions: [
        widget,
        const SpaceWH(
          width: 10,
        )
      ],
    );
  }
}
