import 'package:rocket_apps_flutter/graph/graph_container.dart';

class GraphResource {
  GraphContainer container;
  String id;

  GraphResource(this.container, this.id);

  Future<dynamic> get() {
    return container.json.get(_getPath());
  }

  Future<dynamic> put(Object object) {
    return container.json.put(_getPath(), object);
  }

  Future<dynamic> delete() {
    return container.json.delete(_getPath());
  }

  String _getPath() {
    return "${container.partition}/$id";
  }
}
