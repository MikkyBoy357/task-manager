import 'package:flutter/material.dart';
import 'package:task_manager/src/common/application/application.dart';
// import 'package:task_manager/services/todoService.dart';
import 'package:task_manager/src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoService.startService();

  runApp(const MyApp());
}
