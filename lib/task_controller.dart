
import 'package:get/get.dart';
import 'package:taskmanager/models/todo-item.dart';
import 'package:taskmanager/servises/db.dart';

class TaskController extends GetxController {
  final _items = <TodoItem>[].obs;
  final isLoading = false.obs;



  List<TodoItem> get items {
    return [..._items];
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await _refreshItems();
  }

  _refreshItems() async {
    isLoading.toggle();
    final items_map = await DB.getItems();
    _items.value = [];
    items_map.forEach((map) {
      _items.add(TodoItem.fromMap(map));
    });
    isLoading.toggle();
  }
}