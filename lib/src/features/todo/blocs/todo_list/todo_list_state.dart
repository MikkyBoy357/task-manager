part of 'todo_list_bloc.dart';

sealed class TodoListState {
  final List<Todo> todos;
  const TodoListState({required this.todos});
}

final class TodoListInitial extends TodoListState {
  TodoListInitial({required List<Todo> todos}) : super(todos: todos);
}

final class TodoListUpdated extends TodoListState {
  TodoListUpdated({required List<Todo> todos})
      : super(todos: TodoService().getMikeList());
}
