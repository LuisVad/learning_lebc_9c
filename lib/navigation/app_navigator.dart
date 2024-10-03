import 'package:flutter/material.dart';
import 'package:learning_lebc_9c/modules/home/screens/home.dart';
import 'package:learning_lebc_9c/modules/profile/screens/profile_screen.dart';
import 'package:learning_lebc_9c/modules/reservations/screens/reservation.dart';
import 'package:learning_lebc_9c/modules/top/screens/top_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
int _selectedIndex = 0;
static const List<Widget> _widgetOptions = <Widget>[
    Home(), // Página Home
    TopScreen(), // Página Top
    ReservationListScreen(), // Página Reservations
    ProfileScreen(), // Página Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Top 5',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Reservaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}