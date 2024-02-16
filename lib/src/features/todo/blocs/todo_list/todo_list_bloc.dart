import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/application/services/todo_repository.dart';
import '../../domain/domain.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoRepository _todoRepository;

  TodoListBloc(this._todoRepository) : super(const TodoListInitial([])) {
    on<LoadTodos>(_loadTodos);
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
    on<UpdateTodo>(_updateTodo);
    on<DoneTodo>(_doneTodo);
  }

  void _loadTodos(LoadTodos event, Emitter<TodoListState> emit) async {
    try {
      emit(TodoListLoading());
      final todos = _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void _addTodo(AddTodo event, Emitter<TodoListState> emit) async {
    try {
      await _todoRepository.addTodo(event.todo);
      // Refresh todos to reflect the change
      final todos = _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoListState> emit) async {
    try {
      await _todoRepository.deleteTodo(event.todo);
      // Refresh todos to reflect the change
      final todos = _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void _updateTodo(UpdateTodo event, Emitter<TodoListState> emit) async {
    try {
      await _todoRepository.updateTodo(event.todo, event.newTodo);
      // Refresh todos to reflect the change
      final todos = await _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }

  void _doneTodo(DoneTodo event, Emitter<TodoListState> emit) async {
    try {
      await _todoRepository.doneTodo(event.todo);
      // Refresh todos to reflect the change
      final todos = _todoRepository.getTodos();
      emit(TodoListLoaded(todos));
    } catch (error) {
      emit(TodoListError(error.toString()));
    }
  }
}
