import 'package:get/get.dart';

import '../domain/todo_model.dart';
import '../data/todo_respository.dart';

class TodoController extends GetxController {
  TodoController({required this.todoRespository});

  final ITodoRespository todoRespository;

  Rxn<TodoModel> _todo = Rxn<TodoModel>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    ever(_todo, (_) => {print("todo change")});
    super.onReady();
  }

  void loadData() async {
    try {
      _todo.value = await todoRespository.getTodo();
    } catch (e) {
      print("testing : " + e.toString());
    }
    try {
      List<TodoModel> test = await todoRespository.getTodos();
    } catch (e) {
      print('testing 2 : '+ e.toString());
    }
  }

  TodoModel? get todo => _todo.value;
}
