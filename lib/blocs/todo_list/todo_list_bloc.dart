import 'package:bloc/bloc.dart';
import 'package:task_manager/models/todo.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitial(todos: [])) {
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
    on<UpdateTodo>(_updateTodo);
    on<DoneTodo>(_doneTodo);
  }

  void _addTodo(AddTodo event, Emitter<TodoListState> emit) {
    print("..1.. => ..${state.todos}");
    state.todos.add(event.todo);
    print("..2.. => ..${state.todos}");
    emit(TodoListUpdated(todos: state.todos));
    print("..3.. => ..${state.todos}");
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoListState> emit) {
    state.todos.remove(event.todo);
    emit(TodoListUpdated(todos: state.todos));
  }

  void _updateTodo(UpdateTodo event, Emitter<TodoListState> emit) {
    for (int i = 0; i < state.todos.length; i++) {
      if (event.todo.id == state.todos[i].id) {
        state.todos[i] = event.todo;
      }
    }
    emit(TodoListUpdated(todos: state.todos));
  }

  void _doneTodo(DoneTodo event, Emitter<TodoListState> emit) {
    for (int i = 0; i < state.todos.length; i++) {
      if (event.todo.id == state.todos[i].id) {
        state.todos[i] = event.todo.copyWith(
          isCompleted: !state.todos[i].isCompleted,
        );
      }
    }
    emit(TodoListUpdated(todos: state.todos));
  }
}
