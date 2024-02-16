import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/todo/domain/domain.dart';
import '../../features/todo/presentation/presentation.dart';
import '../common.dart';

GoRouter appRouter(BuildContext context) {
  return GoRouter(
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
              final todo = state.extra as Todo?;

              return DetailsScreen(
                action: state.uri.queryParameters["action"] ?? "read",
                todo: todo,
              );
            },
          ),
        ],
      ),
    ],
  );
}
