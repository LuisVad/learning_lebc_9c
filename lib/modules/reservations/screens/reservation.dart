import 'package:flutter/material.dart';

class ReservationListScreen extends StatelessWidget {
  const ReservationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> reservations = [
      {'name': 'Luis Valladolid', 'date': '2023-09-01', 'time': '18:00'},
      {'name': 'Daniela Landa', 'date': '2023-09-02', 'time': '19:00'},
      {'name': 'Alicia Madison', 'date': '2023-09-03', 'time': '20:00'},
      {'name': 'Cristopher Soto', 'date': '2023-09-04', 'time': '21:00'},
      {'name': 'Charlie Carrillo', 'date': '2023-09-05', 'time': '22:00'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Reservas'),
        backgroundColor: const Color.fromARGB(255, 26, 207, 180),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/top');
        },
        child: const Icon(Icons.list),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ListTile(
            leading: const Icon(Icons.event),
            title: Text(reservation['name']!),
            subtitle: Text('${reservation['date']} at ${reservation['time']}'),
          );
        },
      ),
    );
  }
}
