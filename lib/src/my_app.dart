import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/common/common.dart';
import 'package:task_manager/src/common/router/app_router.dart';
import 'package:task_manager/src/features/todo/cubits/cubits.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoListCubit(
            TodoRepository(
              TodoService(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter(context),
        theme: lightTheme,
      ),
    );
  }
}
