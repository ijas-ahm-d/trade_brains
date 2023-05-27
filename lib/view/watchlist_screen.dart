import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/components/common/c_app_bar.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/space.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/company_view_model.dart';
import 'package:trade_brains/view_model/watchlist_view_model.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watchProvider = context.watch<WatchListViewModel>();
    final companyProvider = context.watch<CompanyViewModel>();
    return Scaffold(
      backgroundColor: blackBG,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "Watchlist"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceWH(height: 20),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: size.height * 0.65,
                width: size.width * 0.9,
                child: ListView.builder(
                  itemCount: watchProvider.companyModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = watchProvider.companyModelList[index];
                    log(data?.companyName! ?? "error");
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: khash,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data?.companyName}",
                              style: textstyle(
                                15,
                                FontWeight.w500,
                                kwhite,
                              ),
                            ),
                            // Text(companyProvider.sharePriceData?.the05Price
                            //         .toString() ??
                            //     "200"),
                          ],
                        ),
                        trailing: IconButton(
                          splashRadius: 1,
                          tooltip: "remove from watchlist",
                          onPressed: () {
                            watchProvider.removeWatchlist(data);
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: kwhite,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
