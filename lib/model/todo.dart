
class Todo {
  String id;
  String name;
  String email;
  int number;  
  bool completed;

  Todo({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.completed,
  });


  // Todo copyWith({
  //   String? id,
  //   String? name,
  //   String? email,
  //   int? number,
  //   bool? completed,
  // }) {
  //   return Todo(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     number: number ?? this.number,
  //     completed: completed ?? this.completed,
  //   );
  // }
}
