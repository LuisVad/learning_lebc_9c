import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_lebc_9c/modules/home/entities/restaurant.dart';
//import 'package:learning_lebc_9c/modules/home/screens/content_column.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db =  FirebaseFirestore.instance;
  final List<Restaurant> _restaurants = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    try {
      final querySnapshot = await db.collection("restaurantes").get();
      for (var doc in querySnapshot.docs) {
        //print('${doc.id} => ${doc.data()}');
        final data = doc.data();
        final restaurant = Restaurant(
          data['titulo'] ?? 'Sin título',
          data['description'] ?? 'Sin descripción',
          List<String>.from(data['images'] ?? []),
          (data['rating'] as num?)?.toDouble() ?? 0.0,
          data['count'] ?? 0,
        );
        _restaurants.add(restaurant);
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      //print('Error al obtener restaurantes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: const Color.fromARGB(255, 26, 207, 180),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: () {
          
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4, // Le da un pequeño sombreado
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen del restaurante
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                  child: Image.network(
                    _restaurants[0].images[0],
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16), // Separación entre imagen y texto
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título del restaurante
                      Text(
                        _restaurants[0].titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Descripción del restaurante
                      Text(
                        _restaurants[0].description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, // Corta el texto si es muy largo
                      ),
                      const SizedBox(height: 12),
                      // Sección de rating y otros detalles
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange[300], size: 20),
                          const SizedBox(width: 4),
                          Text(
                            _restaurants[0].rating.toString(),
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Spacer(),
                          // Mostrar cantidad de comentarios o visitas
                          Text(
                            '${_restaurants[0].count} reviews',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
