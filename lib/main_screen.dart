import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/task_controller.dart';

class MainScreen extends GetWidget<TaskController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: controller.items.map((e) => Text(e.task)).toList(),
              )));
    throw UnimplementedError();
  }
}
