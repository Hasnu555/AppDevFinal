// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:practice/bloc/todo_bloc.dart'; // Import your TodoBloc
// import 'package:practice/bloc/todo_event.dart';
// import 'package:practice/bloc/todo_state.dart';
// import 'package:practice/model/todo.dart';



// class TodoScreen extends StatefulWidget {
//   @override
//   _TodoScreenState createState() => _TodoScreenState();
// }

// class _TodoScreenState extends State<TodoScreen> {
//   final TextEditingController _todoController = TextEditingController();
//   final TextEditingController _updateTodoController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final todoBloc = BlocProvider.of<TodoBloc>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo App'),
//       ),
//       body: BlocBuilder<TodoBloc, TodoState>(
//         builder: (context, state) {
//           if (state is TodoInitial) {
//             // Load initial data when the app starts
//             todoBloc.add(LoadTodos());
//           }
//           if (state is TodoLoading) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (state is TodoLoaded) {
//             final todos = state.todos;

//             return ListView.builder(
//               itemCount: todos.length,
//               itemBuilder: (context, index) {
//                 final todo = todos[index];

//                 return ListTile(
//                   title: Text(todo.name),
//                   subtitle: Text(todo.email),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Checkbox(
//                         value: todo.completed,
//                         onChanged: (value) {
//                           // Update todo completion status
//                           todoBloc.add(
//                             UpdateTodo(
//                               todo.copyWith(completed: value ?? false),
//                             ),
//                           );
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           // Show a dialog to edit the todo
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               _updateTodoController.text = todo.name; // Initialize the text field with the current todo name
//                               return AlertDialog(
//                                 title: Text('Edit Todo'),
//                                 content: TextField(
//                                   controller: _updateTodoController,
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter Updated Todo Name',
//                                   ),
//                                 ),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     child: Text('Cancel'),
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                   ),
//                                   TextButton(
//                                     child: Text('Save'),
//                                     onPressed: () {
//                                       // Update the todo with the new name
//                                       final updatedName = _updateTodoController.text;
//                                       if (updatedName.isNotEmpty) {
//                                         final updatedTodo = todo.copyWith(name: updatedName);
//                                         todoBloc.add(UpdateTodo(updatedTodo));
//                                         _updateTodoController.clear();
//                                         Navigator.of(context).pop();
//                                       }
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           // Delete todo on button press
//                           todoBloc.add(DeleteTodo(todo.id));
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//           if (state is TodoError) {
//             return Center(
//               child: Text('Error: ${state.errorMessage}'),
//             );
//           }
//           return Container();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Show a dialog to add a new todo
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Add Todo'),
//                 content: TextField(
//                   controller: _todoController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter Todo Name',
//                   ),
//                 ),
//                 actions: <Widget>[
//                   TextButton(
//                     child: Text('Cancel'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   TextButton(
//                     child: Text('Add'),
//                     onPressed: () {
//                       // Add a new todo
//                       final todoName = _todoController.text;
//                       if (todoName.isNotEmpty) {
//                         final newTodo = Todo(
//                           id: '',
//                           name: todoName,
//                           email: '',
//                           number: 0,
//                           completed: false,
//                         );
//                         todoBloc.add(AddTodo(newTodo));
//                         _todoController.clear();
//                         Navigator.of(context).pop();
//                       }
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _todoController.dispose();
//     _updateTodoController.dispose();
//     super.dispose();
//   }
// }
