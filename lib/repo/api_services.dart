import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:trade_brains/repo/api_status.dart';

class ApiServices {
  static Future getmethod(
    String url,
    Function function,
  ) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Success");
        return Success(
          response: function(response.body),
        );
      }
      return Failures(
        code: response.statusCode,
        errrorResponse: "Invalid response",
      );
    } on HttpException {
      return Failures(
        code: 101,
        errrorResponse: "No Internet",
      );
    } on FormatException {
      return Failures(
        code: 102,
        errrorResponse: "Invalid Format",
      );
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(
        code: 101,
        errrorResponse: "No Internet",
      );
    } on TimeoutException {
      return Failures(
        code: 104,
        errrorResponse: "Time Out",
      );
    } catch (e) {
      log(e.toString());
      return Failures(
        code: 500,
        errrorResponse: "Unknown error",
      );
    }
  }
}
