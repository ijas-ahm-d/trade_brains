import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/components/common/c_snack_bar.dart';
import 'package:trade_brains/model/trade_brains_db.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/space.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/company_view_model.dart';
import 'package:trade_brains/view_model/watchlist_view_model.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyViewModel>();
    final watchList = context.watch<WatchListViewModel>();
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.7,
      width: size.width * 0.9,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: provider.companyList?.length ?? 0,
        separatorBuilder: (context, index) => const SpaceWH(
          height: 15,
        ),
        itemBuilder: (context, index) {
          final data = provider.companyList?[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                  tooltip: watchList.isWatchlist(CompanyData(
                          companyName: data?.the2Name,
                          companySympol: data?.the1Symbol))
                      ? "remove from watchlist"
                      : "add to watchlist",
                  splashRadius: 1,
                  onPressed: () async {
                    if (!watchList.isWatchlist(
                      CompanyData(
                          companyName: data?.the2Name,
                          companySympol: data?.the1Symbol),
                    )) {
                      watchList.addWatchList(
                        CompanyData(
                          companyName: data?.the2Name,
                          companySympol: data?.the1Symbol,
                          currencyType: data?.the8Currency,
                          sharePrice:
                              await provider.getSharePrice(data!.the1Symbol!) ??
                                  "No share Price",
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      CommonSnackBAr.snackBar(
                        context: context,
                        data: "Company data added to watchlist",
                        color: specialGreen,
                      );
                    } else {
                      watchList.removeWatchlist(
                        CompanyData(
                            companyName: data?.the2Name,
                            companySympol: data?.the1Symbol),
                      );
                    }
                  },
                  icon: watchList.isWatchlist(
                    CompanyData(
                        companyName: data?.the2Name,
                        companySympol: data?.the1Symbol),
                  )
                      ? const Icon(Icons.remove)
                      : const Icon(Icons.add),
                  color: kwhite,
                )),
          );
        },
      ),
    );
  }
}
