import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/components/common/c_snack_bar.dart';
import 'package:trade_brains/components/home/data_not_found.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/space.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/watchlist_view_model.dart';

class WatchListItems extends StatelessWidget {
  const WatchListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WatchListViewModel>();
    return Center(
      child: provider.companyModelList.isEmpty
          ? const DataNotFound()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SpaceWH(height: 15);
                },
                physics: const BouncingScrollPhysics(),
                itemCount: provider.companyModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = provider.companyModelList[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: khash,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        "${data?.companyName?.toUpperCase()}",
                        style: textstyle(
                          15,
                          FontWeight.w500,
                          kwhite,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          style: textstyle(
                            15,
                            FontWeight.w600,
                            Colors.green,
                          ),
                          children: [
                            TextSpan(
                              text: "Share price : ",
                              style: textstyle(
                                12,
                                FontWeight.w300,
                                Colors.grey,
                              ),
                            ),
                            TextSpan(text: data?.sharePrice),
                            TextSpan(
                              text: " (${data?.currencyType})",
                              style: textstyle(
                                12,
                                FontWeight.w300,
                                kwhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        splashRadius: 1,
                        tooltip: "remove from watchlist",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: kwhite,
                                title: Text(
                                  "Remove",
                                  style: textstyle(
                                    14,
                                    FontWeight.bold,
                                    kblack,
                                  ),
                                ),
                                content: const Text(
                                  "Are you sure do you want to Remove this from watchlist?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      provider.removeWatchlist(data);
                                      Navigator.pop(context);
                                      CommonSnackBAr.snackBar(
                                        context: context,
                                        data:
                                            "Data removed from your watchlist",
                                        color: snackbarRed,
                                      );
                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
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
    );
  }
}
