import '../../../features/todo/domain/domain.dart';
import '../application.dart';

class TodoRepository {
  final TodoService _todoService;

  TodoRepository(this._todoService);

  List<Todo> getTodos() => _todoService.getMikeList();

  Future<void> addTodo(Todo todo) => _todoService.addTodo(todo);

  Future<void> deleteTodo(Todo todo) => _todoService.deleteTodo(todo);

  Future<void> updateTodo(Todo todo, Todo newTodo) =>
      _todoService.updateTodo(todo, newTodo);

  Future<void> doneTodo(Todo todo) => _todoService.doneTodo(todo);
}
