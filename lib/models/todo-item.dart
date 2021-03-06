
class TodoItem {
  static String table = 'todo_items';
  int id;
  String task;
  bool complete;

  TodoItem({this.id = -1, required this.task, required this.complete});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'task': task,
      'complete': complete ? 1 : 0,
    };
    return map;
  }

  static TodoItem fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'],
      task: map['task'],
      complete: map['complete'] == 1,
    );
  }
}
