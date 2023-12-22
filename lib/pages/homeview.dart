import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/todo_bloc.dart';
import 'package:practice/bloc/todo_event.dart';
import 'package:practice/bloc/todo_state.dart';
import 'package:practice/pages/addnew.dart';
import 'package:practice/pages/editpage.dart';
import 'package:practice/pages/profilepage.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isGridView = false;
  int _currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).add(LoadTodos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TodoBloc _todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (AddNewPage()),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  final todos = state.todos;
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(todo.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${todo.email}'),
                                Text('${todo.number}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditTodoPage(todo:todo)),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _todoBloc.add(DeleteTodo(todo.id));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is TodoOperationSuccess) {
                  _todoBloc.add(LoadTodos());
                  return Container();
                } else if (state is TodoError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(
            width: 80, // Set the desired width here
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: _isGridView ? Colors.grey[200] : Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.list),
                        onPressed: () {
                          setState(() {
                            _isGridView = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: _isGridView ? Colors.white : Colors.grey[200],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.grid_view),
                        onPressed: () {
                          setState(() {
                            _isGridView = true;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
