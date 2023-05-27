import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/space.dart';
import 'package:trade_brains/utils/text.dart';

class SearchData extends StatelessWidget {
  const SearchData({super.key});

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SpaceWH(
          height: size.width * 0.2,
        ),
        SizedBox(
          width: size.width * 0.5,
          child: SvgPicture.asset(
            "assets/search.svg",
            width: size.width * 0.3,
          ),
        ),
        const SpaceWH(
          height: 10,
        ),
        Text(
          "Please search something...",
          style: textstyle(
            15,
            FontWeight.w400,
            kwhite,
          ),
        ),
      ],
    );
  }
}
