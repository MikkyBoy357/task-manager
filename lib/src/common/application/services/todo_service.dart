import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/todo/domain/domain.dart';

class TodoService {
  // bool _isInitialized = false;

  static const String dbName = 'todoBox';

  final Box<Todo> todoBox = Hive.box(dbName);

  static Future<void> startService() async {
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    Hive.registerAdapter<Todo>(TodoAdapter());

    await Hive.openBox<Todo>(dbName);

    print("MyHive => ${TodoService().getMikeList()}");
  }

  List<Todo> getMikeList() {
    return todoBox.values.toList();
  }

  Future<void> addTodo(Todo _todo) async {
    print("Add Todo => ${_todo.id}");
    await todoBox.add(_todo);
  }

  Future<void> deleteTodo(Todo _todo) async {
    print("Delete Todo => ${_todo.id}");
    await _todo.delete();
  }

  Future<void> updateTodo(Todo _todo, Todo _newTodo) async {
    print("Update Todo => ${_todo.id}");

    _todo
      ..title = _newTodo.title
      ..description = _newTodo.description
      ..isCompleted = _newTodo.isCompleted;

    _todo.save();
  }

  Future<void> doneTodo(Todo _todo) async {
    print("Update Todo => ${_todo.id}");

    _todo.isCompleted = !_todo.isCompleted;
    _todo.save();
  }
}
