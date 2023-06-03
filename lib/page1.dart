import 'package:flutter/material.dart';
import 'package:json/list_user.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int menuSelected = 0;
  String titlePage = "";

  void changeTitle() {
    if (menuSelected == 0) {
      setState(() {
        titlePage = 'Home';
      });
      return;
    }
    if (menuSelected == 1) {
      setState(() {
        titlePage = 'Perfil';
      });
      return;
    }
    if (menuSelected == 2) {
      setState(() {
        titlePage = 'Logout';
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    changeTitle();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(titlePage),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
            menuSelected = index;
          }),
          currentIndex: menuSelected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'sair',
            ),
          ],
        ),
        body: IndexedStack(
          index: menuSelected,
          children: const [
            ListUser(),
            Center(
              child: Text(
                'perfil',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                'sair',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
