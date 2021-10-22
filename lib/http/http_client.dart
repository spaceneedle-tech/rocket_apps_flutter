import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  String host;

  HttpClient(this.host);

  Future<Response> get(String endpoint, {Map<String, String>? headers, String? otherHost}) {
    print(endpoint);
    print(host);
    print(otherHost);
    var teste = "${otherHost == null ? host : otherHost}/$endpoint";
    print(teste);
    return http.get(Uri.parse(teste), headers: headers);
  }

  Future<Response> head(String endpoint, {Map<String, String>? headers}) {
    return http.head(Uri.parse("$host/$endpoint"), headers: headers);
  }

  Future<Response> post(String endpoint,
      {Map<String, String>? headers, body, Encoding? encoding, String? otherHost}) {
    return http.post(Uri.parse("${otherHost == null ? host : otherHost}/$endpoint"),
        body: body, headers: headers, encoding: encoding);
  }

  Future<Response> put(String endpoint,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    return http.put(Uri.parse("$host/$endpoint"),
        headers: headers, body: body, encoding: encoding);
  }

  Future<Response> delete(String endpoint, {Map<String, String>? headers}) {
    return http.delete(Uri.parse("$host/$endpoint"), headers: headers);
  }
}
