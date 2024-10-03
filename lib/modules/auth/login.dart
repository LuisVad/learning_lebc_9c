import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 26, 207, 180),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/usuario.png'),
                      radius: 20,
                    ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Luis Valladolid', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),),
                  Text('Hace 10 minutos', style: TextStyle(color: Colors.black54, fontSize: 12),)
                ],
              ),
              Expanded(child: Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.all(16.0), child: Icon(Icons.more_vert)))),
            ],
          ),
          Image.asset('assets/init.jfif',  width: double.infinity, height: 200),
          const Row(
            children: [
              Padding(padding: EdgeInsets.all(16.0), child: Icon(Icons.favorite, color: Colors.red)),
              Padding(padding: EdgeInsets.all(16.0), child: Icon(Icons.message),),
              Padding(padding: EdgeInsets.all(16.0), child: Icon(Icons.send),),
              Expanded(child: Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.all( 16.0), child: Icon(Icons.save)))),
            ],
          ),
           Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
      
    );
  }
}