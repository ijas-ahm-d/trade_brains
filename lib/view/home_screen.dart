import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/components/common/c_app_bar.dart';
import 'package:trade_brains/components/home/search.dart';
import 'package:trade_brains/components/home/search_result.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/space.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/company_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<CompanyViewModel>();
    return Scaffold(
      backgroundColor: blackBG,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          size.height * 0.07,
        ),
        child: const CommonAppbar(
          title: "Trade Brains",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(
              size: size,
            ),
            provider.companyList == null
                ? Text(
                    "please search something",
                    style: textstyle(15, FontWeight.w500, kwhite),
                  )
                : SearchResultWidget(size: size),
            SpaceWH(
              height: size.width * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
