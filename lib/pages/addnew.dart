import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/todo_bloc.dart';
import 'package:practice/bloc/todo_event.dart';
import 'package:practice/model/todo.dart';

class AddNewPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                
                  labelText: 'Name',
                  suffixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.contains('@')) {
                    return 'invalid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                
                  labelText: 'Number',
                  suffixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.length != 11) {
                    return 'invalid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String name = nameController.text;
                    String email = emailController.text;
                    int number = int.parse(numberController.text);

                    Todo todo = Todo(
                      id: DateTime.now().toString(),
                      name: name,
                      email: email,
                      number: number,
                      completed: true,
                    );

                    BlocProvider.of<TodoBloc>(context).add(AddTodo(todo));
                  }
                },
                child: Text('Add Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
