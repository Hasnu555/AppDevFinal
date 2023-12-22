import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/model/todo.dart';

class FirestoreService {
  final CollectionReference _todosCollection =
  FirebaseFirestore.instance.collection('todos');

  Stream<List<Todo >> getTodos() {
    return _todosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Todo(
          id: doc.id,
          name: data['name'],
          email: data['email'],
          number: data['number'],
          completed: data['completed'],
        );
      }).toList();
    });
  }

  Future<void> addTodo(Todo todo) {
    return _todosCollection.add({
      'name': todo.name,
      'email': todo.email,
      'number': todo.number,
      'completed': todo.completed,
    });
  }

  Future<void> updateTodo(Todo todo) {
    return _todosCollection.doc(todo.id).update({
      'name': todo.name,
      'email': todo.email,
      'number': todo.number,
      'completed': todo.completed,
    });
  }

  Future<void> deleteTodo(String todoId) {
    return _todosCollection.doc(todoId).delete();
  }
}