import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trade_brains/model/company_model.dart';
import 'package:trade_brains/repo/api_services.dart';
import 'package:trade_brains/repo/api_status.dart';
import 'package:trade_brains/utils/urls.dart';

class CompanyViewModel extends ChangeNotifier {
  TextEditingController searchValue = TextEditingController();

  List<BestMatch>? _companyList = [];
  List<BestMatch>? get companyList => _companyList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showResult = false;
  bool get showResult => _showResult;

  getCompanyName(value) async {
    setLoading(true);
    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$value&apikey=$apiKey";
    final respone = await ApiServices.getmethod(
      url,
      companyModelFromJson,
    );
    if (respone is Success) {
      if (respone.response != null) {
        await setCompanyData(
          respone.response as CompanyModel,
        );

        searchResult(true);
      }
      log("Nothing to show");
    }
    if (respone is Failures) {
      await setLoading(false);
      log("Api call failed");
    }
    setLoading(false);
  }

  setCompanyData(CompanyModel companyData) async {
    _companyList = companyData.bestMatches;
    log("!!!!!!!!!!!!");
    log(companyData.toString());
    notifyListeners();
  }

  searchResult(bool bool) {
    _showResult = bool;
  }

  setLoading(bool bool) {
    _isLoading = bool;
  }

  clearList() {
    _companyList?.clear();
    searchValue.clear();
    notifyListeners();
  }
}
