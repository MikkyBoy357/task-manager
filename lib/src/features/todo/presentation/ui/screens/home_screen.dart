import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/common.dart';
import '../../../cubits/cubits.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoListCubit>().loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Todo List'),
      ),
      body: BlocBuilder<TodoListCubit, TodoListState>(
        builder: (context, state) {
          if (state is TodoListLoaded && state.todos.isNotEmpty) {
            final todos = state.todos;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Text(
                      "${todos.where((element) => element.isCompleted).toList().length}/${todos.length} Completed"),
                  const SizedBox(height: 20.0),
                  ListView.separated(
                    itemCount: todos.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: ((context, index) {
                      return SizedBox(height: 5);
                    }),
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return TodoTile(todo: todo);
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            );
          } else if (state is TodoListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoListError) {
            return Center(
              child: Text(state.error, textAlign: TextAlign.center),
            );
          } else {
            return const Center(
              child: Text(
                "Nothing to see here\nClick the add button below",
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: otpColor,
        onPressed: () {
          context.goNamed(
            RouteNames.details,
            queryParameters: {
              "action": "new",
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
