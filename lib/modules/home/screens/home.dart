import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:learning_lebc_9c/modules/home/screens/content_column.dart';

class Restaurant {
  final String _titulo;
  final String _description;
  final List<String>_images;
  final double _rating;
  final int _count;

  Restaurant(this._titulo, this._description, this._images, this._rating, this._count);

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db =  FirebaseFirestore.instance;
  final List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();

    (() async => {
      await db.collection("restaurantes").get().then((event) => {
       for(var doc in event.docs){
        //print('${doc.id} => ${doc.data()}')
        /*final restaurants = Restaurant(
          titulo: doc['titulo'],
          description: doc['description'],
          images: doc['images'],
          rating: doc['rating'],
          price: doc['price'],
        )*/
        final restaurant = Restaurant(
          doc.data()['titulo'],
          doc.data()['description'],
          List<String>.from(doc.data()['images']),
          doc.data()['rating'],
          doc.data()['price'],
        );
        _restaurants.add(restaurant);
       }   
      });
    })();
  }

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
      body: const Row(
        children: [
          //Image.network(restaurants[0].images[0], width: 150, height: 150,),
          const SizedBox(width: 8,),
          Column(
            children: [
              //Text(restaurants[0].name, style: const TextStyle(fontSize: 14.0, color: Colors.black),)
            ],
          )
        ],
      ),
    );
  }
}
