import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Usuarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListPage(),
    );
  }
}

class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

class UserListPage extends StatelessWidget {
  // Lista simulada de usuarios
  final List<User> users = [
    User(name: 'Juan Pérez', imageUrl: 'https://via.placeholder.com/150'),
    User(name: 'María López', imageUrl: 'https://via.placeholder.com/150'),
    User(name: 'Carlos Sánchez', imageUrl: 'https://via.placeholder.com/150'),
    User(name: 'Ana Martínez', imageUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            title: Text(user.name),
          );
        },
      ),
    );
  }
}