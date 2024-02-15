part of 'todo_list_bloc.dart';

sealed class TodoListEvent {
  const TodoListEvent();
}

class AddTodo extends TodoListEvent {
  final Todo todo;

  const AddTodo({required this.todo});
}

class DeleteTodo extends TodoListEvent {
  final Todo todo;

  const DeleteTodo({required this.todo});
}

class UpdateTodo extends TodoListEvent {
  final Todo todo;

  const UpdateTodo({required this.todo});
}
