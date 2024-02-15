import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/blocs/todo_list/todo_list_bloc.dart';
import 'package:task_manager/screens/detail_screen.dart';
import 'package:task_manager/services/todoService.dart';
import 'package:task_manager/utils/route_names.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoService.startService();

  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: RouteNames.home,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: RouteNames.details,
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsScreen(
              action: state.uri.queryParameters["action"] ?? "read",
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoListBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
