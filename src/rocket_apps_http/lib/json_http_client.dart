import 'dart:convert';

import 'package:rocket_apps_http/http_client.dart';
import 'package:rocket_apps_http/json_response.dart';

class JsonHttpClient {
  late HttpClient _http;

  JsonHttpClient(String host) {
    _http = HttpClient(host);
  }

  Future<JsonResponse> get(String endpoint,
      {Map<String, String>? headers, String? otherHost}) async {
    print(endpoint);
    return JsonResponse(
        await _http.get(endpoint, headers: headers, otherHost: otherHost));
  }

  Future<JsonResponse> put(String endpoint, Object object,
      {Map<String, String>? headers, Encoding? encoding}) async {
    return JsonResponse(await _http.put(endpoint,
        body: jsonEncode(object),
        headers: headers,
        encoding: getEncoding(encoding)));
  }

  Future<JsonResponse> post(String endpoint, Object object,
      {Map<String, String>? headers, Encoding? encoding}) async {
    return JsonResponse(await _http.post(endpoint,
        body: jsonEncode(object),
        headers: headers,
        encoding: getEncoding(encoding)));
  }

  Future<JsonResponse> postUrlEconded(
      String endpoint, Map<String, String> object,
      {Map<String, String>? headers,
      Encoding? encoding,
      String? otherHost}) async {
    return JsonResponse(await _http.post(
      endpoint,
      body: object,
      headers: headers,
      encoding: getEncoding(encoding),
      otherHost: otherHost,
    ));
  }

  Future<JsonResponse> delete(String endpoint,
      {Map<String, String>? headers}) async {
    return JsonResponse(await _http.delete(endpoint, headers: headers));
  }

  Encoding getEncoding(Encoding? encoding) {
    if (encoding == null) {
      encoding = Encoding.getByName("utf-8");
    }
    return encoding!;
  }
}
