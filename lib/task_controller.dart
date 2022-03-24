import 'package:get/get.dart';
import 'package:taskmanager/models/todo-item.dart';
import 'package:taskmanager/servises/db.dart';

class TaskController extends GetxController {
  final _items = <TodoItem>[].obs;
  final isLoading = false.obs;
  final isAddingItem = false.obs;
  final RxBool flag = false.obs;

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
    final itemsMap = await DB.getItems();
    _items.value = [];
    for (var map in itemsMap) {
      _items.add(TodoItem.fromMap(map));
    }
    isLoading.toggle();
  }

  createItem(String task) async {
    await DB.createItem(task, 0);
    _refreshItems();
  }

   Future<int> updateItem(TodoItem item, complete) async {
    final db = await DB.db();

    final data = {
      'task': item.task,
      'complete': complete ? 1 : 0,
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [item.id]);
    _refreshItems();
    return result;
  }
}
