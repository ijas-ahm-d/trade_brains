import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart%20';
import 'package:trade_brains/model/company_model.dart';

class WatchListViewModel extends ChangeNotifier {
  final watchListBox = Hive.box<String>('watchListDB');

  List<BestMatch> companyModelList = [];

  bool _isWatchListAdded = false;
  bool get isWatchListAdded => _isWatchListAdded;

  void setWatchlist(bool value) {
    _isWatchListAdded = value;
    notifyListeners();
  }

  Future<void> addWatchList(BestMatch symbol) async {
    await watchListBox.add(symbol.the1Symbol!);
    companyModelList.add(symbol);
    setWatchlist(true);
  }

  bool isWatchlist(BestMatch symbol) {
    if (watchListBox.values.contains(symbol.the1Symbol)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> removeWatchlist(String? symbol) async {
    int? deleteKey;

    if (!watchListBox.values.contains(symbol)) {
      return;
    }

    Map<dynamic, String> watchlistMap = watchListBox.toMap();
    watchlistMap.forEach((key, value) {
      if (symbol == value) {
        deleteKey = key;
      }
    });

    await watchListBox.delete(deleteKey);
    companyModelList.removeWhere((element) => element.the1Symbol == symbol);
    setWatchlist(false);
    log("removed");
  }
}
