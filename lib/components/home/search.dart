import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/company_view_model.dart';

class SearchWidget extends StatelessWidget {
  final Size size;
  const SearchWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyViewModel>();
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.09,
        right: size.width * 0.09,
        left: size.width * 0.09,
        bottom: size.width * 0.07,
      ),
      child: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: CupertinoSearchTextField(
          placeholder: "Search company name",
          style: textstyle(
            15,
            FontWeight.w400,
            kwhite,
          ),
          controller: provider.searchValue,
          onSuffixTap: () {
            provider.clearList();
          },
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          suffixIcon: const Icon(
            CupertinoIcons.xmark_circle_fill,
            size: 25,
            color: kwhite,
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              log("Nothing to search");
            } else {
              provider.getCompanyName(value);
            }
          },
        ),
      ),
    );
  }
}
