import 'package:get/get.dart';

import '../data/todo_api_provider.dart';
import '../data/todo_respository.dart';
import '../controller/TodoController.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ITodoProvider>(() => TodoProvider());
    Get.lazyPut<ITodoRespository>(
        () => TodoRespository(todoProvider: Get.find()));
    Get.lazyPut(() => TodoController(todoRespository: Get.find()));
  }
}
