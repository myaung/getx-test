import 'dart:convert';

import '../domain/todo_model.dart';
import '../../../api/api_connect_http.dart';

abstract class ITodoProvider {
  Future<TodoModel> getTodo(String path);
  Future<List<TodoModel>> getTodos(String path);
}

class TodoProvider extends ApiConnectHttp implements ITodoProvider {
  @override
  Future<TodoModel> getTodo(String path) async {
    var response = await get(path);
    if (response.statusCode == 200) {
      return TodoModel.fromRawJson(response.body);
    } else {
      return Future.error(response.body);
    }
  }

  @override
  Future<List<TodoModel>> getTodos(String path) async {
    var response = await get(path);
    if (response.statusCode == 200) {
      return List<TodoModel>.from(
          (json.decode(response.body) as Iterable<dynamic>)
              .map((dynamic model) => TodoModel.fromJson(model as Map<String, dynamic>))
              .toList());
    } else {
      return Future.error(response.body);
    }
  }
}
