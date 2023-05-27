import 'package:flutter/material.dart';
import 'package:trade_brains/components/common/c_app_bar.dart';
import 'package:trade_brains/components/watchlist/watchlist_items.dart';
import 'package:trade_brains/utils/colors.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: blackBG.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "Watchlist"),
      ),
      body: const WatchListItems(),
    );
  }
}
