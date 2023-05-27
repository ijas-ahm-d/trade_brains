import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/components/common/c_app_bar.dart';
import 'package:trade_brains/components/home/data_not_found.dart';
import 'package:trade_brains/components/home/search.dart';
import 'package:trade_brains/components/home/search_data.dart';
import 'package:trade_brains/components/home/search_result.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/view_model/company_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<CompanyViewModel>();
    return Scaffold(
      backgroundColor: blackBG.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          size.height * 0.07,
        ),
        child: const CommonAppbar(
          title: "Trade Brains",
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode curentFocus = FocusScope.of(context);
          if (!curentFocus.hasPrimaryFocus) {
            curentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchWidget(),
              provider.searchValue.text.isEmpty
                  ? const SearchData()
                  : provider.isLoading
                      ? SizedBox(
                          height: size.height * 0.65,
                          width: size.width * 0.9,
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : provider.companyList!.isEmpty
                          ? const DataNotFound()
                          : const SearchResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
