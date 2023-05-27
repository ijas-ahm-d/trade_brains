import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trade_brains/model/company_model.dart';
import 'package:trade_brains/model/share_price_model.dart';
import 'package:trade_brains/repository/api_services.dart';
import 'package:trade_brains/repository/api_status.dart';
import 'package:trade_brains/utils/urls.dart';

class CompanyViewModel extends ChangeNotifier {
  TextEditingController searchValue = TextEditingController();

  List<BestMatch>? _companyList = [];
  List<BestMatch>? get companyList => _companyList;

  GlobalQuote? _sharePriceData;
  GlobalQuote? get sharePriceData => _sharePriceData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoading2 = false;
  bool get isLoading2 => _isLoading2;

  getCompanyName(String value) async {
    setLoading(true);
    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$value&apikey=$apiKey";
    final response = await ApiServices.getmethod(
      url,
      companyModelFromJson,
    );
    if (response is Success) {
      if (response.response != null) {
        await setCompanyData(
          response.response as CompanyModel,
        );
      }
      log("Nothing to show");
    }
    if (response is Failures) {
      await setLoading(false);
      log("Api call failed");
    }
    setLoading(false);
  }

  Future<String?> getSharePrice(String value) async {
    setLoading2(true);
    String url =
        "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$value&apikey=$apiKey";
    final response = await ApiServices.getmethod(
      url,
      sharePriceModelFromJson,
    );
    if (response is Success) {
      if (response.response != null) {
        SharePriceModel data = response.response as SharePriceModel;
        log("${data.globalQuote?.the05Price}");
        return data.globalQuote?.the05Price;
      }
      log("Nothing to show");
    }
    if (response is Failures) {
      await setLoading2(false);
      log("Api call failed");
    }
    setLoading2(false);
    return null;
  }

  setCompanyData(CompanyModel companyData) async {
    _companyList = companyData.bestMatches;
    notifyListeners();
  }

  setSharePriceData(SharePriceModel data) {
    _sharePriceData = data.globalQuote;
    notifyListeners();
  }

  setLoading(bool bool) {
    _isLoading = bool;
    notifyListeners();
  }

  setLoading2(bool bool) {
    _isLoading2 = bool;
    notifyListeners();
  }

  clearList() {
    _companyList?.clear();
    searchValue.clear();
    notifyListeners();
  }
}
