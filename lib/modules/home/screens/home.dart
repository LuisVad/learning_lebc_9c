import 'package:flutter/material.dart';
import 'package:learning_lebc_9c/modules/home/screens/content_column.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: const Color.fromARGB(255, 26, 207, 180),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, '/reservations'),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ContentColumn(
              title: 'Bienvenido',
              description: 'a mi aplicación',
            ),
            ContentColumn(
              title: 'Otra Línea',
              description: 'Segundo Renglón',
            ),
            ContentColumn(
              title: 'Otra Línea',
              description: 'Tercer Renglón',
            ),
          ],
        ),
      ),
    );
  }
}
