import 'package:flutter/material.dart';

class Home extends StatelessWidget {

const Home({ super.key });

  @override
  Widget build(BuildContext context){
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Bienvenido'),
                Text('A la aplicación'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Otra Línea'),
                Text('Segundo Renglón'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Otra Línea'),
                Text('Tercer Renglón'),
              ],
            ),
          )
        ],
      ),
    );
  }
}