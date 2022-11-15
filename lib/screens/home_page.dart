import 'package:dragon_mangas/screens/homeScreen/navbarScreens/config_screen.dart';
import 'package:dragon_mangas/screens/homeScreen/navbarScreens/home.dart';
import 'package:dragon_mangas/screens/homeScreen/navbarScreens/library_screen.dart';
import 'package:dragon_mangas/screens/homeScreen/navbarScreens/perfil_screen.dart';
import 'package:dragon_mangas/screens/homeScreen/navbarScreens/search_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _screens = [
    HomeScreenPage(),
    LibraryScreen(),
    SearchScreen(),
    PerfilScreen(),
    ConfigScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 100),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text('DRAGON MANGÁS',
              style:
                  GoogleFonts.bebasNeue(fontSize: 36.0, color: Colors.white))),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: GNav(
            gap: 8,
            haptic: true,
            curve: Curves.easeOutExpo,
            rippleColor: Colors.grey[800]!,
            activeColor: Color.fromARGB(255, 255, 255, 255),
            iconSize: 20,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey.shade800,
            backgroundColor: Colors.black,
            color: Colors.white,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Inicio',
              ),
              GButton(
                icon: Icons.my_library_books,
                text: 'Biblioteca',
              ),
              GButton(
                icon: Icons.search,
                text: 'Pesquisar',
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
              ),
              GButton(
                icon: Icons.build,
                text: 'Configuração',
              ),
            ],
            selectedIndex: _selectedPage,
            onTabChange: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
          ),
        ),
      ),
      body: Center(child: _screens.elementAt(_selectedPage)),
    );
  }
}
