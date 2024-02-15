import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_manager/models/todo.dart';

class TodoService {
  bool _isInitialized = false;

  static const String dbName = 'todoBox';

  static Future<void> startService() async {
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    Hive.registerAdapter<Todo>(TodoAdapter());

    await Hive.openBox<Todo>(dbName);
  }

  Future<void> init() async {
    try {
      await Hive.openBox<Todo>(dbName);
      _isInitialized = true;
    } catch (e) {
      _isInitialized = false;
    }
  }

  List<Todo> getMikeList() {
    return Hive.box<Todo>(dbName).values.toList();
  }
}
