import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/application/application.dart';
import '../../domain/domain.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final TodoRepository _todoRepository;

  TodoListCubit(this._todoRepository) : super(const TodoListInitial([])) {
    loadTodos();
  }

  void loadTodos() async {
    emit(TodoListLoading());
    try {
      final todos = await _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void addTodo(Todo todo) async {
    try {
      await _todoRepository.addTodo(todo);
      final todos = await _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void deleteTodo(Todo todo) async {
    try {
      await _todoRepository.deleteTodo(todo);
      final todos = await _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void updateTodo(Todo todo, Todo newTodo) async {
    try {
      await _todoRepository.updateTodo(todo, newTodo);
      final todos = await _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void doneTodo(Todo todo) async {
    try {
      await _todoRepository.doneTodo(todo);
      final todos = await _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }
}
