import 'package:flutter/material.dart';
import 'package:practice/bloc/todo_bloc.dart';
import 'package:practice/bloc/todo_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _numberController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.todo.name);
    _emailController = TextEditingController(text: widget.todo.email);
    _numberController = TextEditingController(text: widget.todo.number.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Number'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: Text('Update Todo'),
              onPressed: () {
                final updatedTodo = Todo(
                  id: widget.todo.id,
                  name: _nameController.text,
                  email: _emailController.text,
                  number: int.parse(_numberController.text),
                  completed: true,
                );

                BlocProvider.of<TodoBloc>(context).add(UpdateTodo(updatedTodo));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}