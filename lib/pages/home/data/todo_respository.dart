import 'package:example_getx/pages/home/data/todo_api_provider.dart';

import '../domain/todo_model.dart';

abstract class ITodoRespository {
  Future<TodoModel> getTodo();
  Future<List<TodoModel>> getTodos();
}

class TodoRespository implements ITodoRespository {
  TodoRespository({required this.todoProvider});

  final ITodoProvider todoProvider;

  @override
  Future<TodoModel> getTodo() async {
    /**
     * code
     */
    return await todoProvider.getTodo('/todos/1');
  }

  @override
  Future<List<TodoModel>> getTodos() async{
    /**
     * code
     */
    return await todoProvider.getTodos('/todos');
  }
}
