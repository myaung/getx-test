import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import './pages/home/controller/TodoController.dart';
import './pages/home/binding/todo_binding.dart';

void main() async {
  TodoBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX',
      home: Home(),
    );
  }
}

class Home extends GetView<TodoController> {
  @override
  Widget build(BuildContext context) {
    print('load ing');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // if(controller.todo != null) Text(controller.todo!.title!),
            Obx(() {
              if (controller.todo != null) {
                return Text(controller.todo!.title!);
              }
              return Text('');
            }),
            TextButton(
                onPressed: () {
                  controller.loadData();
                },
                child: Text('load!')),
          ],
        ),
      ),
    );
  }
}
