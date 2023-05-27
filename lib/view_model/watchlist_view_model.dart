import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart%20';
import 'package:trade_brains/model/trade_brains_db.dart';

class WatchListViewModel extends ChangeNotifier {
  WatchListViewModel() {
    initialize();
    log("called");
  }

  final watchListBox = Hive.box<CompanyData>('WatchListDataBase');

  List<CompanyData?> companyModelList = [];

  void initialize() {
    companyModelList.clear();
    companyModelList.addAll(watchListBox.values);
    notifyListeners();
  }

  Future<void> addWatchList(CompanyData companyData) async {
    await watchListBox.add(companyData);
    companyModelList.add(companyData);
    notifyListeners();
  }

  bool isWatchlist(CompanyData companyData) {
    bool isWatch = false;
    for (var value in watchListBox.values) {
      if (value.companySympol == companyData.companySympol) {
        isWatch = true;
      }
    }
    return isWatch;
  }

  Future<void> removeWatchlist(CompanyData? companyData) async {
    int? deleteKey;

    if (!isWatchlist(companyData!)) {
      return;
    }

    Map<dynamic, CompanyData> watchlistMap = watchListBox.toMap();
    watchlistMap.forEach((key, value) {
      if (companyData.companySympol == value.companySympol) {
        deleteKey = key;
      }
    });

    await watchListBox.delete(deleteKey);
    companyModelList.removeWhere(
        (element) => element?.companySympol == companyData.companySympol);
    notifyListeners();
    log("removed");
  }
}
