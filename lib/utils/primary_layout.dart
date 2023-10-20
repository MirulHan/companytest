import 'package:flutter/material.dart';

class PrimaryLayout extends StatelessWidget {
  const PrimaryLayout({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget layout = Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/favorite');
          }
        },
      ),
    );
    return layout;
  }
}
