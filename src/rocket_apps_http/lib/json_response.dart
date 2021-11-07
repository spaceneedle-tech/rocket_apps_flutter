import 'dart:convert';

import 'package:http/http.dart';

class JsonResponse<T> {
  Response response;

  JsonResponse(this.response);

  // void get() {
  //   _json = this.response.body);

  //   _isJsonReady = true;
  // }

  String get json {
    // if (!_isJsonReady) {
    //   throw Exception(
    //       "JsonResponse is not ready. Call get(...) method before getting Json data");
    // }

    return this.response.body; // _json;
  }

  bool get success {
    return this.response.statusCode >= 200 && this.response.statusCode < 300;
  }

  T? get object {
    if (json.isEmpty) {
      return null;
    }

    return jsonDecode(this.response.body) as T;
  }

  dynamic get jsonObject {
    if (json.isEmpty) {
      return null;
    }

    return jsonDecode(this.response.body);
  }
}
