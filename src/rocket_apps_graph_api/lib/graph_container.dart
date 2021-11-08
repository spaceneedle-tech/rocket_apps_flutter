import 'package:rocket_apps_http/json_http_client.dart';
import 'package:rocket_apps_http/json_response.dart';

class GraphContainer {
  late String partition;
  late JsonHttpClient json;

  GraphContainer(String host, this.partition) {
    json = JsonHttpClient(host);
  }

  Future<JsonResponse> get({Map<String, String>? headers, String? otherHost}) {
    return json.get(partition, otherHost: otherHost);
  }

  Future<JsonResponse> post(Object object, {Map<String, String>? headers}) {
    return json.post(partition, object);
  }

  Future<JsonResponse> postUrlEconded(Map<String, String> object,
      {Map<String, String>? headers}) {
    return json.postUrlEconded(partition, object);
  }

  Future<JsonResponse> put(Object object, {Map<String, String>? headers}) {
    return json.put(partition, object);
  }

  Future<JsonResponse> delete({Map<String, String>? headers}) {
    return json.delete(partition);
  }

  Future<JsonResponse> getResource<T>(String id) {
    return json.get(_getResourceEndpoint(id));
  }

  Future<JsonResponse> deleteResource<T>(String id) {
    return json.delete(_getResourceEndpoint(id));
  }

  Future<JsonResponse> putResource<T>(String id, Object object) {
    return json.put(_getResourceEndpoint(id), object);
  }

  String _getResourceEndpoint(String id) {
    return "$partition/$id";
  }
}
