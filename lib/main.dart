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

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
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
        title: const Text('Lista de contactos'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            tileColor: Colors.white,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            title: Text(user.name),
            subtitle: Text('Descripción del usuario $index'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Acción al hacer clic en el ListTile
              print('Seleccionado: ${user.name}');
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Acción del primer botón
                print("Agregar usuario");
                setState(() {
                  users.add(User(
                      name: 'Nuevo Usuario',
                      imageUrl: 'https://via.placeholder.com/150'));
                });
              },
              child: const Text('add user'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción del segundo botón
                print("Remove user");
              },
              child: const Text('Botón 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción del tercer botón
                print("Botón 3 presionado");
              },
              child: const Text('Botón 3'),
            ),
          ],
        ),
      )),
    );
  }
}
