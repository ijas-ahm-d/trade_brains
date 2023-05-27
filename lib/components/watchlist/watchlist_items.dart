import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/components/common/c_snack_bar.dart';
import 'package:trade_brains/components/home/data_not_found.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/utils/text.dart';
import 'package:trade_brains/view_model/watchlist_view_model.dart';

class WatchListItems extends StatelessWidget {
  const WatchListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WatchListViewModel>();
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: size.height * 0.65,
        width: size.width * 0.9,
        child: provider.companyModelList.isEmpty
            ? const DataNotFound()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.companyModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = provider.companyModelList[index];

                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
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
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          style: textstyle(
                            15,
                            FontWeight.w600,
                            kwhite,
                          ),
                          children: [
                            TextSpan(
                              text: "Share price : ",
                              style: textstyle(
                                12,
                                FontWeight.w300,
                                kwhite,
                              ),
                            ),
                            TextSpan(text: data?.sharePrice),
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
