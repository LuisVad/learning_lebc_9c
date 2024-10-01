/*import 'package:flutter/material.dart';
import 'package:learning_lebc_9c/modules/home/screens/home.dart';
import 'package:learning_lebc_9c/modules/profile/screens/profile_screen.dart';
import 'package:learning_lebc_9c/modules/reservations/screens/reservation.dart';
import 'package:learning_lebc_9c/modules/top/screens/top_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = const [
    Home(), // Página Home
    TopScreen(), // Página Top
    ReservationListScreen(), // Página Reservations
    ProfileScreen(), // Página Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_border),
            selectedIcon: Icon(Icons.star),
            label: 'Artículos',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            selectedIcon: Icon(Icons.book),
            label: 'Reservaciones',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: _pages[_currentPageIndex], // Muestra la página correspondiente según el índice seleccionado
    );
  }
}*/
