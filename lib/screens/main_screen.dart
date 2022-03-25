import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controllers/task_controller.dart';

class MainScreen extends GetWidget<TaskController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64, left: 64, right: 64),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tasks',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 56),
                      ),
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context).canvasColor,
                          border: Border.all(
                              width: 1.0,
                              color: Theme.of(context).primaryColorLight),
                        ),
                        child: IconButton(
                          color: Theme.of(context).primaryColorDark,
                          iconSize: 24,
                          onPressed: () {
                            controller.isAddingItem.toggle();
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    height: 1,
                    width: 377,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.only(top: 12),
                      children: controller.items
                              .map(
                                (item) => ListTile(
                                  leading: Checkbox(
                                    value: item.complete,
                                    onChanged: (bool? value) {
                                      controller.updateItem(item, value);
                                    },
                                    activeColor:
                                        Theme.of(context).primaryColorDark,
                                  ),
                                  title: Text(
                                    item.task,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                              .toList() +
                          [
                            if (controller.isAddingItem.value)
                              ListTile(
                                title: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  cursorColor:
                                      Theme.of(context).primaryColor,
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
                ),
              ],
            )),
    );
  }
}
