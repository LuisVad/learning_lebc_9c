import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Retrasa la navegación por 5 segundos
    Future.delayed(const Duration(seconds: 5), () {
      // Verifica si el widget sigue montado antes de navegar
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido
          children: [
            Image.asset(
              'assets/stop.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 32), // Espacio entre la imagen y el texto
            const Text(
              'Cargando...',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
