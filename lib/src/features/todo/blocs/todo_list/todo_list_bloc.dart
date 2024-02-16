import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/application/application.dart';
import '../../domain/domain.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitial(todos: TodoService().getMikeList())) {
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
    on<UpdateTodo>(_updateTodo);
    on<DoneTodo>(_doneTodo);
  }

  void _addTodo(AddTodo event, Emitter<TodoListState> emit) {
    // Hive operation
    TodoService().addTodo(event.todo);
    emit(TodoListUpdated(todos: state.todos));
    print("..3.. => ..${state.todos}");
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoListState> emit) {
    // Hive operation
    TodoService().deleteTodo(event.todo);
    emit(TodoListUpdated(todos: state.todos));
  }

  void _updateTodo(UpdateTodo event, Emitter<TodoListState> emit) {
    // Hive operation
    TodoService().updateTodo(event.todo, event.newTodo);
    emit(TodoListUpdated(todos: state.todos));
  }

  void _doneTodo(DoneTodo event, Emitter<TodoListState> emit) {
    // Hive operation
    TodoService().doneTodo(event.todo);
    emit(TodoListUpdated(todos: state.todos));
  }
}
