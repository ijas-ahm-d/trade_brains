import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/model/trade_brains_db.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/company_view_model.dart';
import 'package:trade_brains/view_model/watchlist_view_model.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyViewModel>();
    final watchProvider = context.watch<WatchListViewModel>();
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.65,
      width: size.width * 0.9,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: provider.companyList?.length,
        itemBuilder: (context, index) {
          final data = provider.companyList?[index];
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFF262A34),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                data?.the2Name.toString() ?? "",
                style: textstyle(
                  14,
                  FontWeight.w500,
                  Colors.grey,
                ),
              ),
              trailing: IconButton(
                tooltip: watchProvider.isWatchlist(CompanyData(
                
                        companyName: data?.the2Name,
                        companySympol: data?.the1Symbol))
                    ? "remove from watchlist"
                    : "add to watchlist",
                splashRadius: 1,
                onPressed: () {
                  if (!watchProvider.isWatchlist(
                    CompanyData(
                        companyName: data?.the2Name,
                        companySympol: data?.the1Symbol),
                  )) {
                    watchProvider.addWatchList(
                      CompanyData(
                          companyName: data?.the2Name,
                          companySympol: data?.the1Symbol),
                    );
                  } else {
                    watchProvider.removeWatchlist(CompanyData(
                        companyName: data?.the2Name,
                        companySympol: data?.the1Symbol));
                  }
                },
                icon: watchProvider.isWatchlist(CompanyData(
                        companyName: data?.the2Name,
                        companySympol: data?.the1Symbol))
                    ? const Icon(Icons.remove)
                    : const Icon(Icons.add),
                color: kwhite,
              ),
            ),
          );
        },
      ),
    );
  }
}
