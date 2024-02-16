part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoListEvent {}

class AddTodo extends TodoListEvent {
  final Todo todo;
  const AddTodo(this.todo);
  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoListEvent {
  final Todo todo;
  const DeleteTodo(this.todo);
  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoListEvent {
  final Todo todo;
  final Todo newTodo;
  const UpdateTodo({required this.todo, required this.newTodo});
  @override
  List<Object> get props => [todo, newTodo];
}

class DoneTodo extends TodoListEvent {
  final Todo todo;
  const DoneTodo(this.todo);
  @override
  List<Object> get props => [todo];
}
