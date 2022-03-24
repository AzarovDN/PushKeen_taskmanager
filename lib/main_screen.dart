import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/task_controller.dart';

class MainScreen extends GetWidget<TaskController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      body: Obx(() =>
      controller.isLoading.value
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Row(
              children: [
                const Text('Tasks'),
                IconButton(
                    onPressed: () {
                      controller.isAddingItem.toggle();
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: controller.items
                  .map((item) =>
                  ListTile(
                    leading: Checkbox(
                        value: item.complete,
                        onChanged: (bool? value) {
                          controller.updateItem(item, value);
                        },

                    ),
                    title: Text(item.task),
                  ))
                  .toList() +
                  [
                    if (controller.isAddingItem.value)
                      ListTile(
                        title: TextField(
                          controller: textController,
                          onSubmitted: (String value) {
                            if (value != '') {
                              controller.createItem(value);
                            }
                            textController.clear();
                            controller.isAddingItem.toggle();
                          },
                          autofocus: true,
                        ),
                      )
                  ],
            ),
          ),
        ],
      )),
    );
  }
}
