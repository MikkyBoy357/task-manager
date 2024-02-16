part of 'todo_list_bloc.dart';

abstract class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object> get props => [];
}

class TodoListInitial extends TodoListState {
  final List<Todo> todos;
  const TodoListInitial(this.todos);
  @override
  List<Object> get props => [todos];
}

class TodoListLoading extends TodoListState {}

class TodoListLoaded extends TodoListState {
  final List<Todo> todos;
  const TodoListLoaded(this.todos);
  @override
  List<Object> get props => [todos];
}

class TodoListError extends TodoListState {
  final String error;
  const TodoListError(this.error);
  @override
  List<Object> get props => [error];
}
